<html>
<head>
  <title>${pagetitle}</title>
  <script type="text/javascript" src="./static/bmweb.js"></script>
  <link type="text/css" rel="stylesheet" href="./static/bmweb.css"></link>
  <meta name="og:title" content="${apptitle} - ${appsubtitle}" />
  <meta property="og:image" content="./static/anti-christ_upside_down_cross.png" />
  %if queried:
    %if results:
      <meta name="description" content="${results[random.randrange(len(results))].__str__()}" />
    %else:
      <meta name="description" content="No results for ${search} :(" />
    %endif
  %else:
    <meta property="og:description" content="${appsubtitle}" />
  %endif
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/> 

</head>
<body><div id="bodyContent">

<a href="https://github.com/mrled/biblemunger"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://camo.githubusercontent.com/a6677b08c955af8400f44c6298f40e7d19cc5b2d/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f677261795f3664366436642e706e67" alt="Fork me on GitHub" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_right_gray_6d6d6d.png"></a>

<h1><a href="./">${apptitle}</a></h1>
<p class="headingCaption">${appsubtitle}</p>

<p>Find some text in the Bible and replace it with other text.</p>
<p><i>(Inspired by <a href="http://the-toast.net/tag/bible-verses/">some excellence</a> by Mallory Ortberg. XML KJV from <a href="http://sourceforge.net/projects/zefania-sharp/">the Zefania project</a>, which probably doesn't appreciate this use of it.)</i></p>

%if favorites:
  <p>Can't think of anything to search for? Try these:
  <ul id="searchFaves"> 
    %for fav in favorites:
      <li><a href="./?search=${fav['search']}&replace=${fav['replace']}">${fav['search']} &rArr; ${fav['replace']}</a></li>
    %endfor
  </ul></p>
%endif

<form id="mungerForm" method=GET action="./">
  <span class="labelAndBox" id="searchBox">Search:
    <input type=text name="search" size=20 autofocus="true" autocapitalize="off"
      value="${search if search else ""}" /></span>
  <span class="labelAndBox" id="replaceBox">Replace:
    <input type=text name="replace" size=20 autocapitalize="off"
      value="${replace if replace else ""}" /></span>
  <span id="mungeButton"><input type=submit value="Munge" /></span>
</form>

%if queried:
  <h2>${resultstitle}</h2>
  <p>Embolden replacement text 
    <input name="embolden" id="emboldenbox" type="checkbox" checked="checked" onclick="emboldenMunged()"></p>
  <div id="mungedResults">
    %if results:
      <table border=0 cellspacing=5 cellpadding=5 align="CENTER">
      %for verse in results:
        <tr><td><strong>${verse.book} ${verse.chapter}:${verse.verse}</strong></td>
        <td>${verse.text_markedup}</td></tr>
      %endfor
      </table>
    %else:
      <p>None</p>
    %endif
  </div>
%endif     

</div></body>
</html>
