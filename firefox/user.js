// Restore session on startup
user_pref("browser.startup.page", 3);

// Enable middle mouse button scroll
user_pref("general.autoScroll", true);

// Declutter new tab
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);

// Show browser history ahead of search suggestions
user_pref("browser.urlbar.showSearchSuggestionsFirst", false);

// Auto submit crash reports
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", true);

// Disable inbuilt password manager
user_pref("signon.rememberSignons", false);

// Switch tabs by scrolling on tab bar
user_pref("toolkit.tabbox.switchByScrolling", true);

// Highlight all matches
user_pref("findbar.highlightAll", true);

// Disable Pocket
user_pref("extensions.pocket.enabled", false);

// Enable custom user stylesheets
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// Auto-upgrade to HTTPS if available
user_pref("dom.security.https_first", true);

// Disable fullscreen warning
user_pref("full-screen-api.transition-duration.enter", "0 0");
user_pref("full-screen-api.transition-duration.leave", "0 0");
user_pref("full-screen-api.warning.delay", -1);
user_pref("full-screen-api.warning.timeout", 0);

// Enable address bar calculator
user_pref("browser.urlbar.suggest.calculator", true);

// Enable address bar unit converter
user_pref("browser.urlbar.unitConversion.enabled", true);

// Dock DevTools to right
user_pref("devtools.toolbox.host", "right");
