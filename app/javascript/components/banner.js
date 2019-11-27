import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["But first,^1000 coffee."],
    typeSpeed: 50,
    loop: false
  });
}

export { loadDynamicBannerText };
