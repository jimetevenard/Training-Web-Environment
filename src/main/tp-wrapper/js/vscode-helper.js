/**
 * VSCODE HELPER
 * 
 * Jim ETEVENARD - 2023
 */
const vscodeHelper = {
    overLightMenu: function(menuLabelsArray){

        if(!(menuLabelsArray && menuLabelsArray.length)) {
            throw new Error("This function must be called with a non-empty menu-labels Array !");
        }
    
        function _overLight(menuItem){
            menuItem.setAttribute("style","background: purple;");
            menuItem.querySelector('a').setAttribute("style", "color: white;");
            menuItem.dispatchEvent(new MouseEvent("mouseover"));
        }
    
        // On déplie le menu principal
        const vscodeDocument = document.querySelector('iframe').contentDocument;
        const btn = vscodeDocument.querySelector('div.menubar-menu-button');
        btn.dispatchEvent(new MouseEvent("mousedown"));
    
        function _overLightRecurse(){
            const currentLabel = menuLabelsArray.shift();
            setTimeout(() => {
                vscodeDocument.querySelectorAll('div.monaco-menu li.action-item').forEach(menuItem => {
                    const labelForTerminalSubMenu = menuItem.querySelector(`span[aria-label="${currentLabel}"]`);
                    if(labelForTerminalSubMenu){
                        console.log(labelForTerminalSubMenu);
                        _overLight(menuItem);
                        if(menuLabelsArray.length) _overLightRecurse();
                    }
                   
                })
            }, 300);
        }
    
        _overLightRecurse();
    }
};
