function displaySection(sectionId) {
    const sections = document.querySelectorAll('.section');
    const navLinks = document.querySelectorAll('.nav-link');

    sections.forEach(section => {
        section.classList.remove('active');
    });

    navLinks.forEach(link => {
        link.classList.remove('active');
    });

    document.getElementById(sectionId).classList.add('active');
    document.querySelector(`.nav-link[onclick="displaySection('${sectionId}')"]`).classList.add('active');

    window.history.pushState({}, '', `?section=${sectionId}`);
}

function handleNavigation() {
    const urlParams = new URLSearchParams(window.location.search);
    const section = urlParams.get('section');

    if (section) {
        displaySection(section);
    } else {
        displaySection('projects');
    }
}

function toggleNavbar() {
    const navbar = document.querySelector('.navbar');
    navbar.classList.toggle('collapsed');
}

function toggleUserMenu() {
    const userMenu = document.querySelector('.user-menu');
    userMenu.classList.toggle('show');
}

document.addEventListener('DOMContentLoaded', function() {
    handleNavigation();

    const navToggler = document.querySelector('.navbar-toggler');
    navToggler.addEventListener('click', toggleNavbar);

    const userInfo = document.querySelector('.user-info');
    userInfo.addEventListener('click', toggleUserMenu);

    window.addEventListener('click', function(event) {
        const userMenu = document.querySelector('.user-menu');
        if (!event.target.closest('.user-info') && userMenu.classList.contains('show')) {
            userMenu.classList.remove('show');
        }
    });
});