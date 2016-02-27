# Use Search-Cloud to find all AdminVMs and filter to see if they are vApp Templates. This is the part I had a hard time with using the Get-* commandlets.
search-cloud -querytype adminvapptemplate -filter "org==$((get-org GSS-SRT).id)" | `
     select @{N='Catalog';               E={ $_.CatalogName} }, `
            @{N='VM Name';               E={ $_.Name} }, `
            @{N='Creation Date';         E={ $_.CreationDate} }, `
            @{N='VDC Name';              E={ $_.VdcName} }, `
            @{N='OwnerName';             E={ $_.OwnerName }}` `
     | export-csv core5-srt-templates.csv