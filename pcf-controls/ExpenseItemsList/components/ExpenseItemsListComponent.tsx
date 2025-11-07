import * as React from "react";

export interface IExpenseItem {
    id: string;
    title: string;
    description?: string;
    amount: number;
    currency: string;
    date: string;
    category: string;
    status: string;
    vendor?: string;
    receiptUrl?: string;
}

export interface IExpenseItemsListProps {
    items: IExpenseItem[];
    selectedItem: string | null;
    selectedItems: string[];
    allowMultiSelect: boolean;
    theme: string;
    onItemSelect: (item: IExpenseItem) => void;
    onMultiItemSelect: (items: IExpenseItem[]) => void;
}

export const ExpenseItemsListComponent: React.FC<IExpenseItemsListProps> = ({
    items,
    selectedItem,
    selectedItems,
    allowMultiSelect,
    theme,
    onItemSelect,
    onMultiItemSelect
}) => {
    const [internalSelectedItems, setInternalSelectedItems] = React.useState<string[]>(selectedItems);

    React.useEffect(() => {
        setInternalSelectedItems(selectedItems);
    }, [selectedItems]);

    const handleItemClick = (item: IExpenseItem) => {
        if (allowMultiSelect) {
            const newSelection = internalSelectedItems.includes(item.id)
                ? internalSelectedItems.filter(id => id !== item.id)
                : [...internalSelectedItems, item.id];
            
            setInternalSelectedItems(newSelection);
            const selectedItemObjects = items.filter(i => newSelection.includes(i.id));
            onMultiItemSelect(selectedItemObjects);
        } else {
            onItemSelect(item);
        }
    };

    const formatCurrency = (amount: number, currency: string): string => {
        return new Intl.NumberFormat('en-US', {
            style: 'currency',
            currency: currency
        }).format(amount);
    };

    const formatDate = (dateString: string): string => {
        return new Date(dateString).toLocaleDateString();
    };

    const getStatusColor = (status: string): string => {
        switch (status.toLowerCase()) {
            case 'approved':
                return '#10b981';
            case 'rejected':
                return '#ef4444';
            case 'pending':
                return '#f59e0b';
            default:
                return '#6b7280';
        }
    };

    const themeClass = `expense-items-list ${theme}`;

    return (
        <div className={themeClass}>
            <div className="expense-items-header">
                <h3>Expense Items</h3>
                {allowMultiSelect && (
                    <span className="selection-count">
                        {internalSelectedItems.length} selected
                    </span>
                )}
            </div>
            
            {items.length === 0 ? (
                <div className="no-items">
                    <p>No expense items found</p>
                </div>
            ) : (
                <div className="expense-items-container">
                    {items.map((item) => {
                        const isSelected = allowMultiSelect 
                            ? internalSelectedItems.includes(item.id)
                            : selectedItem === item.id;
                        
                        return (
                            <div
                                key={item.id}
                                className={`expense-item ${isSelected ? 'selected' : ''}`}
                                onClick={() => handleItemClick(item)}
                                role="button"
                                tabIndex={0}
                                onKeyDown={(e) => {
                                    if (e.key === 'Enter' || e.key === ' ') {
                                        e.preventDefault();
                                        handleItemClick(item);
                                    }
                                }}
                            >
                                {allowMultiSelect && (
                                    <div className="checkbox-container">
                                        <input
                                            type="checkbox"
                                            checked={isSelected}
                                            onChange={() => {}} // Handled by parent click
                                            tabIndex={-1}
                                        />
                                    </div>
                                )}
                                
                                <div className="expense-item-content">
                                    <div className="expense-item-header">
                                        <h4 className="expense-title">{item.title}</h4>
                                        <div className="expense-amount">
                                            {formatCurrency(item.amount, item.currency)}
                                        </div>
                                    </div>
                                    
                                    {item.description && (
                                        <p className="expense-description">{item.description}</p>
                                    )}
                                    
                                    <div className="expense-item-details">
                                        <div className="expense-meta">
                                            <span className="expense-date">{formatDate(item.date)}</span>
                                            <span className="expense-category">{item.category}</span>
                                            {item.vendor && (
                                                <span className="expense-vendor">{item.vendor}</span>
                                            )}
                                        </div>
                                        
                                        <div 
                                            className="expense-status"
                                            style={{ color: getStatusColor(item.status) }}
                                        >
                                            {item.status}
                                        </div>
                                    </div>
                                    
                                    {item.receiptUrl && (
                                        <div className="expense-receipt">
                                            <a 
                                                href={item.receiptUrl} 
                                                target="_blank" 
                                                rel="noopener noreferrer"
                                                onClick={(e) => e.stopPropagation()}
                                            >
                                                📎 View Receipt
                                            </a>
                                        </div>
                                    )}
                                </div>
                            </div>
                        );
                    })}
                </div>
            )}
        </div>
    );
};