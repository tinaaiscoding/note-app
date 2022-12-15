// SORY BY FEATURE
const sortBtn = document.querySelector('.sort-btn');
const dropdownContent = document.querySelector('.dropdown-content');

sortBtn.addEventListener('click', () => {
  document.querySelector('.dropdown-content').classList.toggle('sort-list-visible');
});

window.addEventListener('click', (event) => {
  if (!event.target.matches('.sort-btn')) {
    dropdownContent.classList.add('sort-list-visible');
  }
});

// LIST CHECKBOX
const allListCheckbox = document.querySelectorAll('.list-checkbox');

allListCheckbox.forEach(checkbox => {
  checkbox.addEventListener('click', () => {
    item = checkbox.nextElementSibling
    item.classList.toggle('completed-item')
  })
});