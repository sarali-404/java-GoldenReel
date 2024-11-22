document.addEventListener('DOMContentLoaded', () => {
    const movieCards = document.querySelectorAll('.movie-card');

    // Event delegation for dropdown links
    document.querySelectorAll('.dropdown-content a').forEach(link => {
        link.addEventListener('click', e => {
            e.preventDefault(); // Prevent default link behavior
            const filterType = link.closest('.dropdown').querySelector('.dropdown-button').textContent.trim().toLowerCase();
            const filterValue = link.dataset.filter;

            // Update the movie list based on filter
            movieCards.forEach(card => {
                const matches = filterType === 'genre' && (filterValue === 'all-genres' || card.dataset.genre === filterValue) ||
                                filterType === 'format' && (filterValue === 'all-formats' || card.dataset.format === filterValue) ||
                                filterType === 'language' && (filterValue === 'all-languages' || card.dataset.language === filterValue);

                card.style.display = matches ? 'block' : 'none';
            });
        });
    });
});

