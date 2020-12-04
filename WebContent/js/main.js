const toggleBtn = document.querySelector('.navbar_togleBtn');
const menu = document.querySelector('.navbar_menu');
const myinfo = document.querySelector('.navbar_myinfo');

toggleBtn.addEventListener('click', () => {
    menu.classList.toggle('active');
    myinfo.classList.toggle('active');
});
