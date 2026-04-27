# Growgypt — AI UI Generation Prompt (First 4 Features)

## App Overview

**App Name:** Growgypt (Grow + Egypt)
**Platform:** Flutter (iOS & Android)
**Concept:** A modern investment & stock trading app for the Egyptian market (EGX — Egyptian Exchange). Inspired by Thndr (Egypt's leading investment app) but with a unique identity.
**Target Users:** Young Egyptian investors (20–35), Arabic-speaking, mobile-first.
**Language:** English UI (with potential Arabic RTL support later).

---

## Design System & Theme

### Colors (Dark Theme — Primary)
- **Background:** Deep dark (#0D0D0D or #121212)
- **Surface/Card:** Dark grey (#1E1E1E or #1A1A1A)
- **Primary Accent:** Gold/Amber (#FFD700 or #F5A623) — represents growth & Egyptian heritage
- **Positive/Gain:** Green (#00C853 or #4CAF50)
- **Negative/Loss:** Red (#FF1744 or #F44336)
- **Text Primary:** White (#FFFFFF)
- **Text Secondary:** Grey (#9E9E9E or #B0B0B0)
- **Dividers/Borders:** Subtle dark (#2C2C2C)

### Typography
- Clean sans-serif font (Inter, Poppins, or SF Pro)
- Large bold numbers for stock prices
- Compact text for secondary info

### Design Principles
- Dark-first (like Thndr, Robinhood, Binance)
- Card-based layouts with subtle elevation
- Green/Red color coding for price changes
- Minimalist with focus on data readability
- Smooth transitions and micro-animations
- Bottom navigation bar (4–5 tabs)

---

## Feature 1: Authentication (4 Screens)

### Screen 1.1: Splash / Onboarding
- App logo "Growgypt" with gold accent on dark background
- Brief tagline: "Invest in Egypt's Future"
- Optional: 2–3 onboarding slides showing key features
- "Get Started" CTA button (gold/amber)

### Screen 1.2: Login Screen
- Dark background
- App logo at top (smaller)
- Email input field (outlined, dark surface)
- Password input field (with show/hide toggle)
- "Login" button (gold/amber, full width)
- "Forgot Password?" link
- Divider: "or"
- "Create Account" secondary button/link
- Clean, centered layout with generous spacing

### Screen 1.3: Register Screen
- Dark background
- "Create Account" title
- Name input field
- Email input field
- Password input field (with strength indicator)
- Confirm Password field
- "Register" button (gold/amber, full width)
- "Already have an account? Login" link
- Terms & conditions checkbox

### Screen 1.4: Forgot Password Screen
- Simple centered layout
- Email input field
- "Send Reset Link" button
- Back to login link

### API Endpoints (for reference):
```
POST /api/auth/register  → { name, email, password }
POST /api/auth/login     → { email, password }
GET  /api/auth/me        → Returns user profile (requires JWT)
```

---

## Feature 2: Home / Market Dashboard (2 Screens)

### Screen 2.1: Home Screen (Main Dashboard)
- **Top Bar:** "Growgypt" logo + notification bell + user avatar
- **Market Summary Card:**
  - EGX30 index value with change % (green/red)
  - Mini sparkline chart showing today's trend
  - Market status badge: "Open" (green) or "Closed" (red)
- **Quick Actions Row:** Horizontal scroll of circular icons
  - Search, Watchlist, Portfolio, Top Gainers, Top Losers
- **Top Movers Section:**
  - Horizontal scrollable cards showing top 5 gainers/losers
  - Each card: Symbol, Company name (truncated), Price, Change %
  - Green border for gainers, Red border for losers
- **Watchlist Preview:**
  - Shows first 3–5 items from user's watchlist
  - "See All →" link
  - Each item: Symbol, Price, Change %, mini sparkline
- **Recently Viewed:**
  - Horizontal scroll of recently viewed stock tiles

### Screen 2.2: Search Screen
- **Search Bar** at top (auto-focus on entry)
- **Recent Searches** section (chips)
- **Popular Stocks** section (when search is empty)
- **Search Results:** List of matching stocks
  - Each result: Symbol (bold), Company name, Current price, Change %
  - Tap to navigate to Stock Detail
- Search filters: "All", "Gainers", "Losers"

---

## Feature 3: Stocks — Browse & Detail (3 Screens)

### Screen 3.1: Stocks List Screen
- **Tab Bar** at top: "All Stocks" | "Gainers" | "Losers" | "Most Active"
- **Sort options:** By name, price, change %, volume
- **Stock List** (scrollable):
  - Each item in a card/row:
    - Left: Stock symbol (bold, large) + Company name (smaller, grey)
    - Right: Current price (large) + Change amount & % (green/red badge)
    - Optional: Mini sparkline chart
  - Pull-to-refresh
  - Shimmer loading skeleton while fetching

### Screen 3.2: Stock Detail Screen (KEY SCREEN — most complex)
- **Header:**
  - Back button
  - Stock symbol + Company name
  - Add to Watchlist (star/heart icon toggle)
- **Price Section:**
  - Current price (very large, bold)
  - Change: +/- amount and % (green/red)
  - "Live" indicator dot (pulsing green when streaming)
- **Interactive Chart:**
  - Line/Area chart with gradient fill (green if up, red if down)
  - Time period selector tabs: 1D | 1W | 1M | 3M | 6M | 1Y | ALL
  - Touch to see price at specific point
- **Key Stats Grid (2 columns):**
  - Open, High, Low, Close
  - Volume, Market Cap
  - 52W High, 52W Low
  - P/E Ratio, EPS
- **Action Buttons (bottom fixed):**
  - "Buy" button (green, large)
  - "Sell" button (red, large)
  - Side by side, equal width

### Screen 3.3: Market Overview Screen
- **EGX30 Index Card:**
  - Large chart (area/line)
  - Current value, change, %
- **Sector Performance:**
  - Horizontal bar chart or heatmap showing sector performance
  - Banks, Real Estate, Telecom, Materials, etc.
- **Market Stats:**
  - Total volume, Total value traded
  - Advancing vs. Declining stocks count

### API Endpoints:
```
GET /api/stocks           → List all stocks
GET /api/stocks/:symbol   → Stock detail
GET /api/stocks/market/summary → Market overview
GET /api/stocks/gainers   → Top gainers
GET /api/stocks/losers    → Top losers
```

### Sample Stock Data (EGX Companies):
| Symbol | Company |
|--------|---------|
| COMI   | Commercial International Bank |
| HRHO   | Hermes Holding |
| EAST   | Eastern Company |
| SWDY   | El Sewedy Electric |
| TMGH   | Talaat Moustafa Group |
| EFIH   | EFG Hermes |
| MNHD   | Madinet Nasr Housing |
| OCDI   | Orascom Development |
| FWRY   | Fawry |
| ABUK   | Abu Qir Fertilizers |
| ETEL   | Telecom Egypt |
| JUFO   | Juhayna Food |

---

## Feature 4: Real-Time Price Streaming (Integrated into existing screens)

This feature enhances the Stock Detail and Home screens with live data:

### Real-Time Elements:
- **Live Price Ticker:** On Stock Detail screen, price updates every 2–3 seconds with subtle animation (fade/slide)
- **Price Flash Effect:** Brief green flash on price up, red flash on price down
- **Live Badge:** Pulsing green dot next to "Live" text when streaming
- **Home Screen Ticker:** Horizontal scrolling ticker bar at top/bottom showing live prices
- **Watchlist Live Updates:** Prices in watchlist update in real-time with color flash

### WebSocket Connection:
```
WSS: wss://stock-backend-r2qd.onrender.com/ws/prices
Subscribe: { "action": "subscribe", "symbols": ["COMI", "HRHO"] }
Subscribe All: { "action": "subscribe_all" }
Unsubscribe: { "action": "unsubscribe", "symbols": ["COMI"] }
```

### Animation Guidelines:
- Price change: Number rolls/slides to new value
- Color: Briefly flashes green (up) or red (down), then returns to default
- Chart: Smoothly extends with new data point
- Connection status: Show reconnecting state if WebSocket drops

---

## Bottom Navigation Bar

5 tabs:
1. **Home** (house icon) — Dashboard
2. **Stocks** (trending-up icon) — Browse all stocks
3. **Search** (search icon) — Search stocks (or combine with Stocks tab as 4 tabs)
4. **Portfolio** (briefcase icon) — User's portfolio (future feature, placeholder for now)
5. **Profile** (person icon) — User settings (future feature, placeholder for now)

Active tab: Gold/Amber icon
Inactive tab: Grey icon
Dark background bar

---

## Additional Design Notes

- **Loading States:** Use shimmer/skeleton screens (not spinners) for all data loading
- **Empty States:** Friendly illustrations + call-to-action for empty watchlist, no search results, etc.
- **Error States:** Retry button + friendly message for network errors
- **Pull-to-Refresh:** On all list screens
- **Egyptian Context:** Prices in EGP (Egyptian Pound), use "ج.م" or "EGP" suffix
- **Number Formatting:** Use comma separators (e.g., 1,234.56 EGP)
- **Inspiration:** Thndr, Robinhood, Binance, Webull — but with unique gold/dark Egyptian identity
