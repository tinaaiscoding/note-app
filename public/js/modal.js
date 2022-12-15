const backdrop = document.querySelector('#backdrop');

const signUpBtn = document.querySelector('.sign-up-btn');
const signUpModal = document.querySelector('#sign-up-modal');
const cancelSignUpBtn = signUpModal.querySelector('.btn-passive');

const logInBtn = document.querySelector('.log-in-btn');
const logInModal = document.querySelector('#log-in-modal');
const cancelLogInBtn = logInModal.querySelector('.btn-passive');

// BACKDROP
function backDropOn() {
  backdrop.classList.add('visible');
}

function backDropOff() {
  backdrop.classList.remove('visible');
}

function removeBackdropHandler() {
  signUpModal.classList.remove('visible');
  logInModal.classList.remove('visible');
  backDropOff();
}

// SIGN UP MODAL
function showSignUpModal() {
  signUpModal.classList.add('visible');
  backDropOn();
}

// LOG IN MODAL
function showLogInModal() {
  logInModal.classList.add('visible');
  backDropOn();
}

// CANCEL (CLOSE) MODAL
function cancelModalHandler() {
  removeBackdropHandler();
  resetForm();
}

backdrop.addEventListener('click', removeBackdropHandler);

signUpBtn.addEventListener('click', showSignUpModal);
cancelSignUpBtn.addEventListener('click', cancelModalHandler);

logInBtn.addEventListener('click', showLogInModal);
cancelLogInBtn.addEventListener('click', cancelModalHandler);