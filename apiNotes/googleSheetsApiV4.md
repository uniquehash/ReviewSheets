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

* what are the [basics of reading using GSA](https://developers.google.com/sheets/api/guides/values#methods)?
	* use the spreadsheets.values collection
		* spreadsheets.values.get
			* single range
		* spreadsheets.values.batchGet
			* multiple ranges
			* obviously more efficient
	* to read data from a sheet you need
		* spreadsheetID
		* range A1 notation
	* format of the output is controlled by three optional parameters
		* `majorDimension`
			* default value
				* `ROWS`
			* determins the format of the matrix returned
			* two possible values
				* `ROWS`
				* `COLUMNS`
			* these are basically rotations of each other determining how the data is grouped in the return matrix
				* `ROWS` will produced what you would expect
				* `COLUMNS` will produce the opposite of what you would expect
		* `valueRenderOption`
			* default value
				* `FORMATTED_VALUE`
			* determines how values should be rendered in the output 
		* `dateTimeRenderOption`
			* default value
				* `SERIAL_NUMBER`
			* determines how dates should be rendered in the output 
			* only used if the `valueRenderOption` is not `FORMATTED_VALUE`
	* reading a single range
		* to read a single range of data out of a spread sheet use a `spreadsheets.values.get` request
			* `GET https://sheets.googleapis.com/v4/spreadsheets/{SPREADSHEET_ID}/values/{RANGE}`
			* returns a `ValueRange` object
	* reading multiple ranges
		* to read multiple discontinuous ranges use a `spreadsheets.values.batchGet` which lets you specify any number of ranges to retrieve
			* `GET https://sheets.googleapis.com/v4/spreadsheets/{SPREADSHEET_ID}/values:batchGet?ranges={RANGE1}&ranges={RANGE2}`
			* returns a `BatchGetValueResponse` object which contains the spreadsheetID and a list of `ValueRange` objects
	
* what are the [basics of writing using GSA](https://developers.google.com/sheets/api/guides/values#writing)?
	* to write you need
		* spreadsheetID
		* range in A1 notation
		* data to write arrange in an appropriate request body object
	* `ValueInputOption` parameter
		* controls whether the input strings are parsed or not
		* required
			* single update
				* can be a query parameter
			* batch updates
				* must be in the request body
		* options
			* `RAW`
				* input is not parsed and is simply inserted as a string
				* input "=1+2" places the string "=1+2" in the cell not a formula
				* non-string values like booleans or numbers are always handled as `RAW`
			* `USER_ENTERED`
				* input is parsed exactly as if it were entered into the Google Sheets UI
				* input "Mar 1 2016" becomes a date
				* input "=1+2" becomes a formula
				* formats may be infered
					* input "$100.15" becomes a number with currency formatting
	* writing a single value
		* to write data to a single range use a `spreadsheets.values.update` request
			* `PUT https://sheets.googleapis.com/v4/spreadsheets/{SPREADSHEET_ID}/values/{RANGE}?valueInputOption={VALUE_INPUT_OPTION}`
			* body: `{ "values": [ [//cell values], //additional rows ] }`
		* the body of the update request must be a `ValueRange` object though the only required field is `values`
		* if `range` is specified it must match the range in the url
		* optionally specify `majorDimension` (`ROWS` default)
		* when updating values with no data are skipped
			* to clear data use an empty string
	* writing multiple ranges
		* if you want to write multiple discontinuous ranges you can use a `spreadsheets.values.bathUpdate` request
			* `POST https://sheets.googleapis.com/v4/spreadsheets/{SPREADSHEET_ID}/values:batchUpdate`
			* body
			```
				{
					"valueInputOption": "{VALUE_INPU_OPTION}"
					"data": [
						{
							"range": "{RANGE}"
							"values": [
								[
									//cell values
								],
								// additional rows
							]
						},
						// additional ranges to update
					]
				}
			```
		* the body of the batchUpdate request must be a `BatchUpdateValuesRequest` object
			* contains
				* `ValueInputOption`
				* list of `ValueRange` objects
					* each specifies its own
						* `range`
						* `majorDimension`
						* and the data to input

* what are the [basics of appending using GSA](https://developers.google.com/sheets/api/guides/values#appending)?
	* searches for an existing table and appends values to the next free row
	* to append data after a table of data in a sheet use a `spreadsheets.values.append` request
		* `POST https://sheets.googleapis.com/v4/spreadsheets/{SPREADSHEET_ID}/values/{RANGE}:append?valueInputOption={VALUE_INPUT_OPTION}`
 		* body
		```
			{
				"values": [
					[
						//cell values
					],
					// additional rows
				]
			}
		```
		* the body of the update request must be a `ValueRange` object
			* only required field is `values`
		* if range is specified it must match the range in the URL
		* optionally specify `majorDimension`
		* input range is used to search for existing data and find a "table" within that range
			* values are appended to the next row of the table
			* starting with the first column of the table 
	* optionally you can choose to overwrite or insert 
		* default overwrites?





























* can [google sheets be used as a basic webscraper](https://www.benlcollins.com/spreadsheets/google-sheet-web-scraper/)?
	* holy fuck it can.



