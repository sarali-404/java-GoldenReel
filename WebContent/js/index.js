// Carousel Slide Function
let currentSlide = 0;

function moveSlide(n) {
    const slides = document.querySelectorAll('.carousel-container img');
    const carouselContainer = document.querySelector('.carousel-container');
    const totalSlides = slides.length;

    // Update the current slide index
    currentSlide += n;

    // Loop back if we exceed boundaries
    if (currentSlide >= totalSlides) {
        currentSlide = 0; // Go to the first slide if at the end
    } else if (currentSlide < 0) {
        currentSlide = totalSlides - 1; // Go to the last slide if before the first
    }

    const offset = -currentSlide * 100;
    carouselContainer.style.transform = `translateX(${offset}%)`;

    console.log(`Current slide index: ${currentSlide}, Offset: ${offset}%`);
}

// Dropdown Filter Logic
document.addEventListener('DOMContentLoaded', () => {
    const movieCards = document.querySelectorAll('.movie-card');

    document.querySelectorAll('.dropdown-content a').forEach(link => {
        link.addEventListener('click', e => {
            e.preventDefault(); // Prevent default link behavior
            const filterType = link.closest('.dropdown').querySelector('.dropdown-button').textContent.trim().toLowerCase();
            const filterValue = link.dataset.filter;

            movieCards.forEach(card => {
                const matches = (filterType === 'genre' && (filterValue === 'all-genres' || card.dataset.genre === filterValue)) ||
                                (filterType === 'format' && (filterValue === 'all-formats' || card.dataset.format === filterValue)) ||
                                (filterType === 'language' && (filterValue === 'all-languages' || card.dataset.language === filterValue));

                card.style.display = matches ? 'block' : 'none';
            });
        });
    });
});

  
