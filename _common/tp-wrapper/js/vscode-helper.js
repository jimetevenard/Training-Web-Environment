/**
 * VSCODE HELPER
 * 
 * Jim ETEVENARD - 2023
 */
const vscodeHelper = {
    _vscodeDocument: () => document.querySelector('iframe').contentDocument,
    _normalize: (label) => label?.replace(/[^a-zA-Z]/g, '').toLowerCase(),
    overLightMenu: function(menuLabelsArray){

        if(!(menuLabelsArray && menuLabelsArray.length)) {
            throw new Error("This function must be called with a non-empty menu-labels Array !");
        }
    
        function _overLight(menuItem){
            menuItem.dispatchEvent(new MouseEvent("mouseover"));
            menuItem.setAttribute("style","background: purple;");
            menuItem.querySelector('a').setAttribute("style", "color: white;");
        }
    
        // On déplie le menu principal
        const btn = vscodeHelper._vscodeDocument().querySelector('div.menubar-menu-button');
        btn.dispatchEvent(new MouseEvent("mousedown"));
    
        function _overLightRecurse(){
            const currentLabel = menuLabelsArray.shift();
            setTimeout(() => {
                vscodeHelper._vscodeDocument().querySelectorAll('div.monaco-menu li.action-item').forEach(menuItem => {
                    const labelForTerminalSubMenu = Array.from(menuItem.querySelectorAll('span'))
                        .find(item => vscodeHelper._normalize(item.getAttribute('aria-label')) == vscodeHelper._normalize(currentLabel));
                    if(labelForTerminalSubMenu){
                        // FixMe : May be triggered twice (or more) but this non-intended behior seems to be mandatory....
                        _overLight(menuItem);
                        if(menuLabelsArray.length) _overLightRecurse();
                    }
                });
            }, 300);
        }
    
        _overLightRecurse();
    },
    triggerLeftViewTab: function(label){
        const tabs = vscodeHelper._vscodeDocument().querySelector('div[id="workbench.parts.activitybar"] ul[role="tablist"]');
        const matchLabel = a => {
            // A selector like `a[aria-label^=${label}]` would not deal with spaces in label
            return a.getAttribute('aria-label').startsWith(label);
        };
        const tabLink = tabs ? Array.from(tabs.querySelectorAll('a')).find(matchLabel) : undefined;
        // fixMe : div#workbench.parts.activitybar find nothing. Why ?

        console.log({tabs, tabLink});
        if(tabLink && tabLink.parentElement.getAttribute('aria-expanded') == 'false'){
            tabLink.click();
        }

    }
};
