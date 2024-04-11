document.addEventListener('DOMContentLoaded', function() {
    fetch('/index/rest') // バックエンドエンドポイントからデータを取得
        .then(response => response.json())
        .then(data => {
            const container = document.getElementById('buttonsContainer');
            
            // data.messagesが配列であることを前提としています
            for (let i = 1; i <= 10; i++) {
                // data.messages配列内でIDが一致する要素を探します
                const item = data.messages.find(item => item.id === i);
                const button = document.createElement('button');
                
                if (item) {
                    button.textContent = `Button ${item.id}`; // ボタンにIDを表示
                    // CMTFLGの最大値に応じて背景色を設定
                    button.style.backgroundColor = item.cmtFlg === 1 ? 'green' : 'red';
	                button.dataset.id = item.id; // ここでdata-id属性にIDを設定
			        // ボタンがクリックされたときのイベントリスナーを追加
			        button.addEventListener('click', function() {
			            const buttonId = this.dataset.id; // データ属性からIDを取得
			            // 特定のIDに基づく新しいページを表示
			            // windowNameはボタンIDに基づいてユニークな値にします
			            const windowName = `messageDetail_${buttonId}`;
			            // 新しいページのURL（実際には適切なURLに置き換えてください）
			            const newPageUrl = `/messages?id=${buttonId}`;
			
			            // 同じIDのページが複数開かないようにする
			            window.open(newPageUrl, windowName);
			        });
                } else {
                    button.textContent = `Button ${i}`; // 対応するデータがない場合
                    button.style.backgroundColor = 'grey'; // データがない場合は灰色に設定
                    button.disabled = true; // データがない場合はボタンを無効化
                }
                
                container.appendChild(button); // コンテナにボタンを追加
            }
        })
        .catch(error => console.error('Error:', error));
});
