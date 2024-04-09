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
	.then(data => {
		console.log('Success:', data);
		// 成功時の処理（ページのリロード）
		setTimeout(function() {
			window.location.reload();
		}, 1000); // 1000ミリ秒後にリダイレクト
	})
	.catch((error) => {
		console.error('Error:', error);
	});
});
