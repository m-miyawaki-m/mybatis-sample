// JavaScriptでFlexGridを設定
import { FlexGrid } from '@grapecity/wijmo.grid';

// データを用意
let data = [
    { id: 1, name: 'Item 1', checked: false },
    { id: 2, name: 'Item 2', checked: true },
    // 他のデータ...
];

// FlexGridを初期化
let theGrid = new FlexGrid('#theGrid', {
    itemsSource: data,
    columns: [
        { binding: 'name', header: 'Name' },
        { binding: 'checked', header: 'Check', isReadOnly: false }
    ]
});

// チェックボックスの表示設定
theGrid.columns.forEach(col => {
    if (col.binding === 'checked') {
        col.dataType = 'Boolean';
    }
});
