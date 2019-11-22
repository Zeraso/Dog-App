const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  // const page = document.getElementById('bannerjava')
  // if document.getElementById('id') == 'bannerjava'
    if (navbar) {
      window.addEventListener('scroll', () => {
      if (window.scrollY >= 450) {
        navbar.classList.add('navbar-lewagon-white');
        } else {
         navbar.classList.remove('navbar-lewagon-white');
        }
      });
    }
}

export { initUpdateNavbarOnScroll };
