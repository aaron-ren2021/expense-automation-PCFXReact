import { IInputs, IOutputs } from "./generated/ManifestTypes";
import * as React from "react";
import * as ReactDOM from "react-dom";
import { ExpenseItemsListComponent, IExpenseItem } from "./components/ExpenseItemsListComponent";

export class ExpenseItemsList implements ComponentFramework.StandardControl<IInputs, IOutputs> {
    private _container: HTMLDivElement;
    private _context: ComponentFramework.Context<IInputs>;
    private _notifyOutputChanged: () => void;
    private _selectedItem: string | null = null;
    private _selectedItems: string[] = [];

    /**
     * Empty constructor.
     */
    constructor() {
        // no-op
    }

    /**
     * Used to initialize the control instance. Controls can kick off remote server calls and other initialization actions here.
     * Data-set values are not initialized here, use updateView.
     * @param context The entire property bag available to control via Context Object; It contains values as set up by the customizer mapped to property names defined in the manifest, as well as utility functions.
     * @param notifyOutputChanged A callback method to alert the framework that the control has new outputs ready to be retrieved asynchronously.
     * @param state A piece of data that persists in one session for a single user. Can be set at any point in a controls life cycle by calling 'setControlState' in the Mode interface.
     * @param container If a control is marked control-type='standard', it will receive an empty div element within which it can render its content.
     */
    public init(
        context: ComponentFramework.Context<IInputs>,
        notifyOutputChanged: () => void,
        state: ComponentFramework.Dictionary,
        container: HTMLDivElement
    ): void {
        this._context = context;
        this._container = container;
        this._notifyOutputChanged = notifyOutputChanged;

        // Set initial selected item from context
        if (context.parameters.selectedItem && context.parameters.selectedItem.raw) {
            this._selectedItem = context.parameters.selectedItem.raw;
        }
    }

    /**
     * Called when any value in the property bag has changed. This includes field values, data-sets, global values such as container height and width, offline status, control metadata values such as label, visible, etc.
     * @param context The entire property bag available to control via Context Object; It contains values as set up by the customizer mapped to property names defined in the manifest, as well as utility functions
     */
    public updateView(context: ComponentFramework.Context<IInputs>): void {
        this._context = context;
        
        // Parse expense items from the bound data
        const expenseItems: IExpenseItem[] = this.parseExpenseItems();
        
        // Get theme and configuration
        const theme = context.parameters.theme?.raw || "default";
        const allowMultiSelect = context.parameters.allowMultiSelect?.raw || false;

        // Render React component
        ReactDOM.render(
            React.createElement(ExpenseItemsListComponent, {
                items: expenseItems,
                selectedItem: this._selectedItem,
                selectedItems: this._selectedItems,
                allowMultiSelect: allowMultiSelect,
                theme: theme,
                onItemSelect: this.handleItemSelect.bind(this),
                onMultiItemSelect: this.handleMultiItemSelect.bind(this)
            }),
            this._container
        );
    }

    /**
     * Parse expense items from the bound dataset
     */
    private parseExpenseItems(): IExpenseItem[] {
        const items: IExpenseItem[] = [];
        
        if (this._context.parameters.items && this._context.parameters.items.sortedRecordIds) {
            this._context.parameters.items.sortedRecordIds.forEach((recordId: string) => {
                const record = this._context.parameters.items.records[recordId];
                if (record) {
                    const item: IExpenseItem = {
                        id: recordId,
                        title: this.getFieldValue(record, "title") || "Untitled",
                        description: this.getFieldValue(record, "description") || "",
                        amount: parseFloat(this.getFieldValue(record, "amount") || "0"),
                        currency: this.getFieldValue(record, "currency") || "USD",
                        date: this.getFieldValue(record, "date") || new Date().toISOString(),
                        category: this.getFieldValue(record, "category") || "General",
                        status: this.getFieldValue(record, "status") || "Pending",
                        vendor: this.getFieldValue(record, "vendor") || "",
                        receiptUrl: this.getFieldValue(record, "receipturl") || ""
                    };
                    items.push(item);
                }
            });
        }
        
        return items;
    }

    /**
     * Get field value from record with fallback
     */
    private getFieldValue(record: ComponentFramework.PropertyHelper.DataSetApi.EntityRecord, fieldName: string): string | undefined {
        const field = record.getValue(fieldName);
        return field ? field.toString() : undefined;
    }

    /**
     * Handle single item selection
     */
    private handleItemSelect(item: IExpenseItem): void {
        this._selectedItem = item.id;
        this._notifyOutputChanged();
    }

    /**
     * Handle multiple item selection
     */
    private handleMultiItemSelect(items: IExpenseItem[]): void {
        this._selectedItems = items.map(item => item.id);
        this._selectedItem = items.length > 0 ? items[0].id : null;
        this._notifyOutputChanged();
    }

    /**
     * It is called by the framework prior to a control receiving new data.
     * @returns an object based on nomenclature defined in manifest, expecting object[s] for property marked as "bound" or "output"
     */
    public getOutputs(): IOutputs {
        return {
            selectedItem: this._selectedItem || ""
        };
    }

    /**
     * Called when the control is to be removed from the DOM tree. Controls should use this call for cleanup.
     * i.e. cancelling any pending remote calls, removing listeners, etc.
     */
    public destroy(): void {
        ReactDOM.unmountComponentAtNode(this._container);
    }
}