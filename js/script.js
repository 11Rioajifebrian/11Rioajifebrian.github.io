const navbarNav = document.querySelector

('.navbar-nav');

document.querySelector('#menu').
onclick = () => {
    navbarNav.classList.toggle('active');

};


const menu = document.querySelector
('#menu');

document.addEventListener('click', function() {
    if(!menu.contains(e.target) && !navbarNav.contains(e.target)) {
        navbarNav.classList.remove('active');
    }
});

    const form = document.getElementById("contactForm");
    form.onsubmit = function (event) {
        event.preventDefault();
        const phoneNumber = "+6289611539784"; // Replace with the WhatsApp phone number you want to message
        const name = form.querySelector("input[placeholder='nama']").value;
        const pesan = form.querySelector("input[placeholder='pesan']").value;
        const message = `Halo, saya ${name}. ${pesan}.`; // Customize the message as you like
        const encodedMessage = encodeURIComponent(message);
        window.location.href = `https://wa.me/${phoneNumber}?text=${encodedMessage}`;
    };