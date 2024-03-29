const daysTag = document.querySelector('.days'),
  currentDate = document.querySelector('.current-date'),
  prevNextIcon = document.querySelectorAll('.icons span');

// getting new date, current year and month
let date = new Date(),
  currYear = date.getFullYear(),
  currMonth = date.getMonth();

// storing full name of all months in array
const months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

const renderCalendar = () => {
  let firstDayofMonth = new Date(currYear, currMonth, 1).getDay(), // getting first day of month
    lastDateofMonth = new Date(currYear, currMonth + 1, 0).getDate(), // getting last date of month
    lastDayofMonth = new Date(currYear, currMonth, lastDateofMonth).getDay(), // getting last day of month
    lastDateofLastMonth = new Date(currYear, currMonth, 0).getDate(); // getting last date of previous month
  let liTag = '';

  for (let i = firstDayofMonth; i > 0; i--) {
    // creating li of previous month last days
    liTag += `<div><li class="inactive">${
      lastDateofLastMonth - i + 1
    }</li></div>`;
  }

  for (let i = 1; i <= lastDateofMonth; i++) {
    // creating li of all days of current month
    // adding active class to li if the current day, month, and year matched
    let isToday =
      i === date.getDate() &&
      currMonth === new Date().getMonth() &&
      currYear === new Date().getFullYear()
        ? 'active'
        : '';
    liTag += `<div><li class="${isToday}">${i}</li></div>`;
  }

  for (let i = lastDayofMonth; i < 6; i++) {
    // creating li of next month first days
    liTag += `<div><li class="inactive">${i - lastDayofMonth + 1}</li></div>`;
  }
  currentDate.innerText = `${months[currMonth]} ${currYear}`; // passing current mon and yr as currentDate text
  daysTag.innerHTML = liTag;
};
renderCalendar();

prevNextIcon.forEach((icon) => {
  // getting prev and next icons
  icon.addEventListener('click', () => {
    // adding click event on both icons
    // if clicked icon is previous icon then decrement current month by 1 else increment it by 1
    currMonth = icon.id === 'prev' ? currMonth - 1 : currMonth + 1;

    if (currMonth < 0 || currMonth > 11) {
      // if current month is less than 0 or greater than 11
      // creating a new date of current year & month and pass it as date value
      date = new Date(currYear, currMonth);
      currYear = date.getFullYear(); // updating current year with new date year
      currMonth = date.getMonth(); // updating current month with new date month
    } else {
      date = new Date(); // pass the current date as date value
    }
    renderCalendar(); // calling renderCalendar function
  });
});

const allDayLi = document.querySelectorAll('.days li');

allDayLi.forEach((li) => {
  gon.notes.forEach((note) => {
    const newPara = document.createElement('p');
    const newPara2 = document.createElement('p');

    if (
      note['date'].length > 1 &&
      note['note_type'] === 'note' &&
      note['date'].slice(-2) == li.textContent
    ) {
      console.log('blue');
      newPara.classList.add('calendar-dot-blue');
      newPara.textContent = '●';
      li.appendChild(newPara);
    }
  });
});

allDayLi.forEach((li) => {
  gon.notes.forEach((note) => {
    const newPara2 = document.createElement('p');
    // console.log('a');

    //     console.log(note['date'].length > 1);
    //     console.log('b');
    //     console.log(note['note_type'] === 'list');
    //     console.log('c');
    //     console.log(note['date'].slice(-2) );
    //     console.log('d');
    //      console.log(li.textContent);

    //      console.log('e');
    //      console.log(li.textContent.slice(0, 2));
    //      console.log(note['date'].slice(-2) === li.textContent.slice(0, 2));

    if (
      note['date'].length > 1 &&
      note['note_type'] === 'list' &&
      note['date'].slice(-2) == li.textContent.slice(0, 2)
    ) {
      console.log('ORANGE');
      newPara2.classList.add('calendar-dot-pink');
      newPara2.textContent = '●';
      li.appendChild(newPara2);
    }
  });
});
