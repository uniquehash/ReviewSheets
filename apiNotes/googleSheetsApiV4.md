# notes on the google sheets api v4


* what does the [google sheets api let you do](https://developers.google.com/sheets/api/guides/concepts)?
	* lets you read and modify any aspect of a spreadsheet
	* two main ways to interact with the spreadsheet
		* reading/writing cell values only
			* spreadsheets.values collection
		* reading/writing any aspect of the spreadsheet
			* spreadsheets collection
			* many more options than the spreadsheets.values collection

* what does GSA mean in terms of the google sheets api?
	* its an accronym i am making up cause fucking typing that out
	* GSA === google sheets api

* what does [spreadsheetID mean in the context of GSA](https://developers.google.com/sheets/api/guides/concepts#spreadsheet_id)?
	* used to identify which spreadsheet is to be accessed or altered
	* every GSA method requires this as a parameter
	* the value between the `/d` and the `/edit` in the url of a spreadsheet
	* a string containing letters, numbers and some special characters
		* regex to extract spreadshit ID for url
			* `/spreadsheets/d/([a-zA-Z0-9-_]+)`
	* corresponds to the ID of the file resource in terms of DriveAPI

* what does [sheet ID mean in the context of GSA](https://developers.google.com/sheets/api/guides/concepts#sheet_id)?
	* used frequently in GSA to specify which sheet is being read or updated within a spreadsheet
	* individual sheets in a spreadsheet have 
		* unique titles
		* IDS
	* sheetID is the value of the `gid` parameter in the url
	* sheetID is numeric
		* regex to extract sheetID from url
			* `[#&]gid([0-9]+)`

* what does [A1 notation mean in the context of GSA](https://developers.google.com/sheets/api/guides/concepts#a1_notation)?
	* a notation needed for some GSA methods
	* used to denote ranges
	* examples
		* `Sheet1!A1:B2`
			* refers to the first two cells in the top two rows of sheet1
		* `Sheet1!A:A`
			* refers to all the cells in the first column of sheet1
		* `Sheet1!1:2`
			* refers to all the cells in the first two rows of sheet1
		* `Sheet1!A5:A`
			* refers to all the cells of the first column of sheet 1 from row 5 onward
		* `A1:B2`
			* refers to the first two cells in the top two rows of the first visible sheet
		* `Sheet1` refers to all the cells in sheet1

* what does [date/time serial numbers mean in the context of GSA](https://developers.google.com/sheets/api/guides/concepts#datetime_serial_numbers)?
	* GSA treats date/time values as decimal values
		* allows you to perform arithmetic on them
	* uses a form of epoch date that is commonly used in spreadsheets
	* when you read cell values you can get dates rendered as strings instead of as serial values 
		* `spreadsheet.values.get` with the `DateTimeRenderOption`

* what is are [partial responses in the context of GSA](https://developers.google.com/sheets/api/guides/concepts#partial_responses)?
	* you can limit what is returned in a GSA response using the `fields` url parameter
	* useful in the spreadsheets.get method
	* increase performance by explicitly listing only the fields you need in the reply
	* the format of the `fields` parameter is the same as the [JSON encoding of a FieldMask](https://developers.google.com/protocol-buffers/docs/reference/google.protobuf#google.protobuf.FieldMask.description.subsection_2)
		* encoded as a single string where paths are separated by a comma
			* `{ mask: "user.displayName,photo"}`
	* example
		* get spreadsheet title, sheet properties, and the value and format of range A1:C10
		* `GET https://sheets.googleapis.com/v4/spreadsheets/spreadsheetId?ranges=A1:C10&fields=properties.title,sheets(sheetProperties,data.rowData.values(effectiveValue,effectiveFormat))`

	































* can [google sheets be used as a basic webscraper](https://www.benlcollins.com/spreadsheets/google-sheet-web-scraper/)?
	* holy fuck it can.



