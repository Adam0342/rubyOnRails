document.addEventListener('DOMContentLoaded', () => {
    const renderButton = document.getElementById('add_ingtedients');
  
    renderButton.addEventListener('click', () => {
      const xhr = new XMLHttpRequest();
      xhr.open('GET', '/add_ingredient', true);
      xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
      xhr.onload = () => {
        if (xhr.status === 200) {
            renderButton.insertAdjacentHTML('beforebegin', xhr.responseText);
        }
    };
        xhr.send();
    });
});
  