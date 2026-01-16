document.addEventListener('DOMContentLoaded', () => {
    loadContent();
    loadWeapons();

    // Setup contact form handler
    const contactForm = document.getElementById('contact-form');
    if (contactForm) {
        contactForm.addEventListener('submit', handleFormSubmit);
    }

    // Filter buttons
    const filterBtns = document.querySelectorAll('.filter-btn');
    filterBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            // Remove active class from all
            filterBtns.forEach(b => b.classList.remove('active'));
            // Add to clicked
            btn.classList.add('active');

            const category = btn.getAttribute('data-filter');
            filterWeapons(category);
        });
    });
});

/**
 * Load static content sections (About, Economy, Maps)
 */
function loadContent() {
    fetch('data/content.json')
        .then(response => response.json())
        .then(data => {
            // About Section
            const aboutContainer = document.getElementById('about-content');
            if (data.about) {
                aboutContainer.innerHTML = `
                    <h3>${data.about.title}</h3>
                    <p>${data.about.content}</p>
                `;
            }

            // Economy Section
            const economyContainer = document.getElementById('economy-content');
            if (data.economy) {
                economyContainer.innerHTML = `
                    <h3>${data.economy.title}</h3>
                    <p>${data.economy.content}</p>
                `;
            }

            // Maps Section
            const mapGrid = document.getElementById('map-grid');
            if (data.maps && Array.isArray(data.maps)) {
                mapGrid.innerHTML = data.maps.map(map => `
                    <div class="card weapon-card">
                        <img src="${map.image}" alt="${map.name}" class="weapon-img" onerror="this.src='https://via.placeholder.com/400x200?text=${map.name}'">
                        <h3>${map.name}</h3>
                        <p style="color: var(--text-muted); font-size: 0.9rem; margin-top: 0.5rem;">${map.desc}</p>
                    </div>
                `).join('');
            }
        })
        .catch(error => {
            console.error('Error loading content:', error);
            document.getElementById('about-content').innerHTML = '<p class="error">Nepodařilo se načíst obsah.</p>';
        });
}

/**
 * Load weapons data
 */
let allWeapons = [];

function loadWeapons() {
    fetch('data/weapons.json')
        .then(response => response.json())
        .then(data => {
            allWeapons = data;
            renderWeapons(allWeapons);
        })
        .catch(error => {
            console.error('Error loading weapons:', error);
            document.getElementById('weapon-grid').innerHTML = '<p class="error">Nepodařilo se načíst zbraně.</p>';
        });
}

function renderWeapons(weapons) {
    const grid = document.getElementById('weapon-grid');
    grid.innerHTML = weapons.map(weapon => `
        <div class="card weapon-card">
            <img src="${weapon.image}" alt="${weapon.name}" class="weapon-img" onerror="this.src='https://via.placeholder.com/300x150?text=${weapon.name}'">
            <h3>${weapon.name}</h3>
            <p style="color: var(--accent-primary); font-weight: bold;">$${weapon.price}</p>
            <div class="weapon-stats">
                <div>DMG: <span class="stat-value">${weapon.damage}</span></div>
                <div>Side: <span class="stat-value">${weapon.side}</span></div>
            </div>
            <p style="font-size: 0.8rem; margin-top: 0.5rem; color: #888;">${weapon.description}</p>
        </div>
    `).join('');
}

function filterWeapons(category) {
    if (category === 'all') {
        renderWeapons(allWeapons);
    } else {
        const filtered = allWeapons.filter(w => w.category === category);
        renderWeapons(filtered);
    }
}

/**
 * Handle Contact Form
 */
function handleFormSubmit(e) {
    e.preventDefault();
    const form = e.target;
    const formData = new FormData(form);
    const responseDiv = document.getElementById('form-response');

    responseDiv.innerHTML = 'Odesílání...';

    fetch(form.action, {
        method: 'POST',
        body: formData
    })
        .then(response => response.text())
        .then(data => {
            responseDiv.innerHTML = `<span style="color: var(--accent-primary)">${data}</span>`;
            form.reset();
        })
        .catch(error => {
            console.error('Error:', error);
            responseDiv.innerHTML = '<span style="color: red">Chyba při odesílání.</span>';
        });
}
