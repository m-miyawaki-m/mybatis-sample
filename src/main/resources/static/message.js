// データ取得と表示を更新する関数
function fetchDataAndUpdatePage() {
    // hiddenフィールドからmessageIdを読み取る
    var messageId = document.getElementById('messageId').value;

	fetch(`/rest/messages?id=${messageId}`)
	.then(response => response.json())
	.then(data => {
		const messagesBody = document.getElementById('messagesBody');
		const timeInput = document.getElementById('time');
		messagesBody.innerHTML = ''; // 既存のメッセージをクリア
		timeInput.value = new Date(data.serverTimestamp).toLocaleString();

		data.messages.forEach(message => {
			const row = messagesBody.insertRow();
			row.insertCell(0).textContent = message.id;
			row.insertCell(1).textContent = message.cmtFlg === 1 ? '済' : '未';
			row.insertCell(2).textContent = message.cmtFlg;
			row.insertCell(3).textContent = message.delFlg;
			row.insertCell(4).textContent = message.message;
			row.insertCell(5).textContent = new Date(message.createdAt).toLocaleString();
			const checkBoxCell = row.insertCell(6);
			const checkBox = document.createElement('input');
			checkBox.type = 'checkbox';
			checkBox.checked = message.cmtFlg === 1;
			checkBox.dataset.id = message.id;
			checkBox.className = 'cmtFlgCheckbox';
			checkBoxCell.appendChild(checkBox);
		});
	})
	.catch(error => console.error('Error:', error));
}

// ページ読み込み時にデータを一度取得
document.addEventListener('DOMContentLoaded', function() {
	fetchDataAndUpdatePage();
	// 30秒ごとにデータを取得しページを更新
	setInterval(fetchDataAndUpdatePage, 30000);
});

// confirmBtnのクリックイベントハンドラ
document.getElementById('confirmBtn').addEventListener('click', function() {
	const checkboxes = document.querySelectorAll('.cmtFlgCheckbox');
	const updates = Array.from(checkboxes).map(checkbox => {
		return {
			id: checkbox.getAttribute('data-id'),
			cmtFlg: checkbox.checked ? 1 : 0
		};
	});

	fetch('/update-cmtFlg', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json',
		},
		body: JSON.stringify(updates),
	})
	.then(response => {
		if (!response.ok) {
			throw new Error('Network response was not ok');
		}
		return response.json();
	})
	// POSTリクエストの.then()内でのページ更新を削除し、代わりにfetchDataAndUpdatePageを呼び出す
	.then(data => {
		console.log('Success:', data);
		fetchDataAndUpdatePage(); // POST成功後にデータを再取得し、ページを更新
	})
	.catch((error) => {
		console.error('Error:', error);
	});
});
