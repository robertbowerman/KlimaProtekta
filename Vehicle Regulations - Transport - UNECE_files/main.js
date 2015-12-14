function AdjustsHeightPanes() {
    // panel-2col-bricks-alternate
    if (jQuery(".panel-2col-bricks-alternate").length > 0) {
        /*Our focus alignment*/
        //jQuery(".center-wrapper .panel-col-first .pane-content").css("min-height","216");
        /*end alignment*/

        if (jQuery(".panel-col-first.seventy  .pane-content").height() > jQuery(".panel-panel.panel-col-last.thirty .pane-content").height()) {
            jQuery(".panel-panel.panel-col-last.thirty  .pane-content").height(jQuery(".panel-col-first.seventy .pane-content").height())
        }
        else {
            jQuery(".panel-col-first.seventy .pane-content").height(jQuery(".panel-panel.panel-col-last.thirty .pane-content").height());
        }
        /*view-blocks-publication-subsite alignment*/
        if (jQuery(".view-blocks-publication-subsite").length > 0) {
            AdjustsHeightElements(".view-blocks-publication-subsite .views-row");
        }
    }
}

function AdjustsHeightElements(unitElement) {
    rowHeight = 0;
    jQuery(unitElement).each(function() {
        if (jQuery(this).height() > rowHeight) {
            rowHeight = jQuery(this).height();
        }
    });
    jQuery(unitElement).height(rowHeight);
};

/* UNECE */
var _pageUID = null;

function pageUID() {
   if (_pageUID == null){
      _pageUID = document.body.id.split('_')[1];
   }
   return _pageUID;
}
function linkPageUID(link) {
   return link.parentNode.id.split('-')[1];
}

var w2Functions = function(){

   var instance = {}; // empty object

   instance.setMenuItems = function() {

      var menu = jQuery('#menu-v2');

      if (menu)
      {
         // open up any menu that has the active page in it.
         jQuery('ul:has(#mid-' + pageUID() + ')', menu).toggle();
         jQuery('ul:has(li[expand=1]):hidden', menu).toggle();
         jQuery('li[expand=1]:visible > ul', menu).show();
         jQuery('li[expand=1] > a', menu).addClass('open');
         jQuery('li:has(ul)', menu).addClass('collapsable');

         // only handle the click for items with subitems...
         jQuery('li.collapsable > a', menu).click(function() {
            // toggle the visiblity of all UL underneath this item
            jQuery(' > ul', this.parentNode).toggle();
            // toggle the classname for the containing item
            this.className = jQuery(this).hasClass('open') ? '' : 'open';     
            // if the items is set to 'clickable' in TYPO3, send the client to this item.
            var returnToLink = ((this.parentNode.attributes.clickable.value != '0') && !( linkPageUID(this) == pageUID() ));
            return returnToLink;
         });
      }
}

   instance.setBreadcrumbClasses = function()
   {
      jQuery('#breadcrumb ul li:first').addClass('first');
      jQuery('#breadcrumb ul li:nth(1)').addClass('second');
      jQuery('#breadcrumb ul li:last').addClass('last');
   }

   return instance;
}

window.onload = function() {

   var eceFunctions = new w2Functions();
   if(document.getElementById("menu-v2"))
   {
      eceFunctions.setMenuItems();
   }
   if(document.getElementById("breadcrumb"))
   {
      eceFunctions.setBreadcrumbClasses();
   }

   if (jQuery.trim(jQuery('.panel-panel.panel-col-top .field-item').text()) < 5)
   {
      jQuery('#page-title').removeClass('title').addClass('sub-home-title');
      jQuery('.panel-panel.panel-col-top').hide();
   }
}