const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon.transparentable');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 200) {
        navbar.classList.remove('transparent');
      } else {
        navbar.classList.add('transparent');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
