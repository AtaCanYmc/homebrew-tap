/**
 * AtaCanYmc Homebrew Tap Website Interactivity
 * Minimalist, dependency-free vanilla JavaScript (Craftsmanship C-1, C-2, R-26)
 */

(function () {
  'use strict';

  // 1. Theme Management (R-21, R-34)
  const themeToggle = document.getElementById('theme-toggle');
  const themeLabel = document.getElementById('theme-label-text');
  const STORAGE_KEY = 'tap_theme_preference';

  function getPreferredTheme() {
    const saved = localStorage.getItem(STORAGE_KEY);
    if (saved === 'light' || saved === 'dark') {
      return saved;
    }
    return window.matchMedia('(prefers-color-scheme: light)').matches ? 'light' : 'dark';
  }

  function applyTheme(theme) {
    document.documentElement.setAttribute('data-theme', theme);
    if (themeLabel) {
      themeLabel.textContent = theme === 'dark' ? 'Dark' : 'Light';
    }
    if (themeToggle) {
      themeToggle.setAttribute('aria-label', `Switch to ${theme === 'dark' ? 'light' : 'dark'} mode`);
    }
  }

  const currentTheme = getPreferredTheme();
  applyTheme(currentTheme);

  if (themeToggle) {
    themeToggle.addEventListener('click', function () {
      const active = document.documentElement.getAttribute('data-theme') || 'dark';
      const nextTheme = active === 'dark' ? 'light' : 'dark';
      localStorage.setItem(STORAGE_KEY, nextTheme);
      applyTheme(nextTheme);
    });
  }

  // 2. Toast Notification
  const toast = document.getElementById('toast');
  let toastTimer = null;

  function showToast(message) {
    if (!toast) return;
    toast.textContent = message;
    toast.classList.add('show');
    clearTimeout(toastTimer);
    toastTimer = setTimeout(function () {
      toast.classList.remove('show');
    }, 2200);
  }

  // 3. Copy to Clipboard (R-26)
  function copyTextToClipboard(text, onSuccess, onError) {
    if (navigator.clipboard && navigator.clipboard.writeText) {
      navigator.clipboard.writeText(text).then(onSuccess).catch(onError);
    } else {
      // Fallback for non-secure contexts
      try {
        const textarea = document.createElement('textarea');
        textarea.value = text;
        textarea.style.position = 'fixed';
        textarea.style.opacity = '0';
        document.body.appendChild(textarea);
        textarea.select();
        const ok = document.execCommand('copy');
        document.body.removeChild(textarea);
        if (ok) onSuccess();
        else onError();
      } catch (err) {
        onError();
      }
    }
  }

  document.querySelectorAll('.copy-btn').forEach(function (button) {
    button.addEventListener('click', function () {
      const targetId = button.getAttribute('data-copy-target');
      if (!targetId) return;

      const targetEl = document.getElementById(targetId);
      if (!targetEl) return;

      const textToCopy = targetEl.textContent.trim();
      if (!textToCopy) return;

      copyTextToClipboard(
        textToCopy,
        function () {
          const originalText = button.querySelector('.copy-text')?.textContent || 'Copy';
          const copySpan = button.querySelector('.copy-text');
          if (copySpan) copySpan.textContent = 'Copied!';
          button.classList.add('copied');
          button.setAttribute('aria-label', 'Command copied to clipboard');

          showToast('Copied to clipboard');

          setTimeout(function () {
            if (copySpan) copySpan.textContent = originalText;
            button.classList.remove('copied');
            button.setAttribute('aria-label', `Copy ${textToCopy}`);
          }, 2000);
        },
        function () {
          showToast('Failed to copy');
        }
      );
    });
  });

  // 4. Live Formula Filter & Search (R-27: includes empty state)
  const searchInput = document.getElementById('formula-search');
  const formulaCards = document.querySelectorAll('.formula-card');
  const emptyState = document.getElementById('formula-empty-state');
  const clearSearchBtn = document.getElementById('clear-search-btn');

  function filterFormulae(query) {
    const term = (query || '').toLowerCase().trim();
    let visibleCount = 0;

    formulaCards.forEach(function (card) {
      const name = (card.getAttribute('data-name') || '').toLowerCase();
      const keywords = (card.getAttribute('data-keywords') || '').toLowerCase();
      const bodyText = (card.textContent || '').toLowerCase();

      const matches = !term || name.includes(term) || keywords.includes(term) || bodyText.includes(term);

      if (matches) {
        card.style.display = '';
        visibleCount++;
      } else {
        card.style.display = 'none';
      }
    });

    if (emptyState) {
      if (visibleCount === 0) {
        emptyState.classList.remove('hidden');
      } else {
        emptyState.classList.add('hidden');
      }
    }
  }

  if (searchInput) {
    searchInput.addEventListener('input', function (e) {
      filterFormulae(e.target.value);
    });
  }

  if (clearSearchBtn && searchInput) {
    clearSearchBtn.addEventListener('click', function () {
      searchInput.value = '';
      filterFormulae('');
      searchInput.focus();
    });
  }
})();
