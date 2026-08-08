//DOM elements
const model = document.getElementById('habit-modal');
const openModalBtn = document.getElementById('open-modal-button');
const closeModalBtn = document.getElementById('close-modal-button');
const addHabitForm = document.getElementById('add-habit-form');
const habitGrid = document.getElementById('habit-grid');

//Toggle Modal Visibility
openModalBtn.addEventListener('click' , () => openModalBtn.style.display = 'flex');
closeModalBtn.addEventListener('click', () => closeModalBtn.style.display = 'none');

//Toggle Habit Completion & Calculation of progress
function toggleHabit(button) {
    const card = button.closest('.habit card');
    card.classList.toggle('completed');
    updateProgress();
}

//calculate progress percentsge
function updateProgress() {
    const totalHabit = document.querySelectorAll('.habit-card').length;
    const completedHabits = document.querySelectorAll('Habit-card.completed').length;

    const percentage = totalHabit > 0 ? Math.round((completedHbait / totalHabit) * 100): 0;

    document.getElementById('progress-percentage').textContent ='${percentage}%';
    document.getElementById('progress-fill').style.width ='${percentage}%';

}

document.addEventListener('DOMContentLoaded',() => {
    const loginForm = document.getElementById('login-form');
    const registerForm = document.getElementById('register-form');
    const loginTab = document.getElementById('login-tab');
    const registerTab = document.getElementById('register-tab');

    loginTab.addEventListener('click',() => {
        loginForm.classList.add('active-form');
        registerForm.classList.remove('active-form');
        loginTab.classList.add('active');
        registerTab.classList.remove('active');
    });
        registerTab.addEventListener('click',() => {
         loginForm.classList.remove('active-form');
        registerForm.classList.add('active-form');
        loginTab.classList.remove('active');
        registerTab.classList.add('active');
        });
    });
//inital progress calculation
updateProgress();

