# Design Direction: AtaCanYmc Homebrew Tap Website

## 1. Product Identity & Goals
- **Product**: Homebrew Tap website for `AtaCanYmc/homebrew-tap`
- **Target Audience**: Developers, makers, and terminal users on macOS & Linux installing custom CLI tools (e.g. `lumina`)
- **Tone**: Technical, minimalist, precise, utilitarian, and fast

## 2. Antislop Dials
- **ENERGY**: 2 (Balanced - technical precision without marketing hype)
- **RHYTHM**: 1 (Structured, predictable terminal & documentation layout)
- **MOTION**: 1 (Utilitarian transitions only, reduced-motion respected, no gratuitous bounce/floating)

## 3. Color Palette & Hierarchy (R-29, R-31)
- **Dark Theme** (default preference for CLI tools):
  - Canvas: `#0f1117` (Deep neutral slate, prevents harsh pure black while avoiding generic blue-purple glow)
  - Surface / Panels: `#161922` (Distinct elevation for code blocks and formula cards)
  - Border: `#262b38` (Subtle boundary with 1px precision)
  - Text Primary: `#e6edf3` (High legibility, passes WCAG AAA contrast ratio > 11:1)
  - Text Muted: `#94a3b8` (Secondary metadata, passes WCAG AA > 5.5:1)
  - Accent: `#f59e0b` (Warm Amber/Brew Gold, functional accent for commands and active tabs)
- **Light Theme**:
  - Canvas: `#f8fafc` (Clean off-white)
  - Surface / Panels: `#ffffff` (Card contrast)
  - Border: `#e2e8f0`
  - Text Primary: `#0f172a` (Deep ink slate, > 14:1 contrast)
  - Text Muted: `#475569` (Slate grey, > 5.5:1 contrast)
  - Accent: `#b45309` (Readable amber on light background)

## 4. Typography (R-06, R-31)
- **Body & Headings**: System sans stack (`-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif`) for native speed and familiarity.
- **Code & Commands**: System monospace stack (`ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace`) for terminal alignment and visual clarity.

## 5. Purpose-Gate Justifications (R-31)
- **Why this color scheme?** Amber/gold accent reflects the Homebrew tap heritage; slate dark/light backgrounds ensure code readability.
- **Why this layout?** Single-page documentation flow: Quick Tap installation at top, searchable Formula cards in the middle, Brewfile & maintenance reference at bottom. Matches developer workflow.
- **Why interactive code boxes?** Terminal users expect instant copy-to-clipboard with immediate feedback.
- **Why live formula search?** Allows instant filtering as the tap grows with more formulae, complete with an explicit empty state.
