*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}   chrome
${url}  https://gist.github.com/iarisaldy



***Keywords***
Open Gist
    open browser    ${url}    ${browser}
    maximize browser window

*** Test Cases ***
As a user, I want to create a public gist.
    Open Gist
    click element   css:svg.octicon.octicon-plus
	input text	    name:gist[contents][][name]    Gist2
	input text      name:gist[contents][][value]    test description
	click element	name:gist[public]
    close browser
    

As a user, I want to edit an existing gist.
    Open Gist
    click element   link:Edit
	click element	name:gist[description]
	cliar text	    name:gist[description]
	input text	    name:gist[description]  gist description edit asa
	click element	xpath:"//*[normalize-space(text()) and normalize-space(.)='Add file'])[1]/following::button[1]"
    close browser

As a user, I want to delete an existing gist.
    Open Gist
    click element    xpath://*[normalize-space(text()) and normalize-space(.)='iarisaldy'])[3]/following::strong[1]"
	click element    xpath://button[@type='submit'])[2]"
    close browser

As a user, I want to see my list of gists.
    Open Gist
    click element    xpath://*[normalize-space(text()) and normalize-space(.)='Back to GitHub'])[1]/following::img[1]"
	click element	 link:Your gists
    close browser