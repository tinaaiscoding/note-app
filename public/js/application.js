// SORY BY FEATURE
const sortBtn = document.querySelector('.sort-btn');
const dropdownContent = document.querySelector('.dropdown-content');

sortBtn.addEventListener('click', () => {
  document.querySelector('.dropdown-content').classList.toggle('visible');
});

window.addEventListener('click', (event) => {
  if (!event.target.matches('.sort-btn')) {
    dropdownContent.classList.remove('visible');
}
});
