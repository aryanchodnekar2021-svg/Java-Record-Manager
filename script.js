document.addEventListener('DOMContentLoaded', () => {
    const form = document.querySelector('form');
    const inputs = document.querySelectorAll('input, select');
    const submitBtn = document.querySelector('.btn-submit');

    // Add focused class to form groups for better visual feedback
    inputs.forEach(input => {
        input.addEventListener('focus', () => {
            input.closest('.form-group')?.classList.add('is-focused');
        });
        input.addEventListener('blur', () => {
            input.closest('.form-group')?.classList.remove('is-focused');
        });
    });

    // Button ripple effect or press effect
    submitBtn.addEventListener('mousedown', () => {
        submitBtn.style.transform = 'scale(0.98)';
    });
    submitBtn.addEventListener('mouseup', () => {
        submitBtn.style.transform = 'translateY(-2px)';
    });

    // Premium entrance animation for form elements
    const elementsToAnimate = document.querySelectorAll('.form-group, .section-label, .btn-submit');
    elementsToAnimate.forEach((el, index) => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(10px)';
        el.style.transition = 'all 0.4s cubic-bezier(0.4, 0, 0.2, 1)';
        
        setTimeout(() => {
            el.style.opacity = '1';
            el.style.transform = 'translateY(0)';
        }, 100 + (index * 50));
    });
});
