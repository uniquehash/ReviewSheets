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

* can you [update spreadsheets other properties via the api](https://developers.google.com/sheets/api/guides/batchupdate)?
	* spreadsheets include many types of data
		* cell formats
		* cell borders
		* named ranges
		* protected ranges
		* conditional formatting
	* `batchUpdate` method allows you to update any of these spreadsheet details
		* changes are grouped together in a batch so that if one request fails none of the other potentially dependent changes are written
	* categories of operation
		* add (and duplicate)
			* add new objects (sometimes based on old ones as in the duplicate requests)
		* update (and set)
			* update certain properties of an object
			* usually leaves the old properties alone
			* set will overwrite the prior data
		* delete
			* remove objects
	* batch update operations
		* works by taking one or more `Request` objects 
			* each one specifyies a single kind of request to perform
		* `Request` objects
			* Spreadsheet Properties
				* UpdateSpreadsheetPropertiesRequest
					* updates properties of a spreadsheet
			* Sheets
				* AddSheetRequest
					* adds a new sheet, when a sheet is added at a given index all subsequent sheet indexes are incremented
				* DuplicateSheetRequest
					* duplicates the contents of a sheet
				* UpdateSheetPropertiesRequest
					* updates properties of the sheet with the specified `sheetID`
				* DeleteSheetRequest
					* deletes the requested sheet
			* Dimensions and their properties
				* InsertDimensionRequest
					* insert rows or columns in a sheet at a particular index
				* AppendDimensionRequest
					* appends rows or columns at the end of a sheet
				* UpdateDimensionPropertiesRequest
					* updates properties of dimensions within the specified range
				* MoveDimensionRequest
					* moves one or more rows or columns
				* AutoResizeDimensionRequest
					* automatically resizes one or more dimensions based on the contents of the cells in that dimension
				* DeleteDimensionRequest
					* deletes the dimensions from the sheet
			* Cells (values, formats, data validations, ect...)
				* RepeatCellRequest
					* updates all cells in the range to the values in the given cell object
					* only the fields listed in the `fields` field are updated others are unchanged
					* formulas will be auto incremented within the range
					* using the `$` indicator will keep the range static
				* UpdateCellRequest
					* updates all cells in a range with new data
				* AppendCellsRequest
					* adds new cells after the last row with data in a sheet, inserting new rows into the sheet if necessary
			* Named Ranges
				* AddNamedRangeRequest
					* adds a named range to the spreadsheet
				* UpdateNamedRangeRequest
					* updates properties of named range with the specified `namedRangeID`
				* DeleteNamedRangeRequest
					* removes the named range with the given ID from the spreadsheet
			* Borders
				* UpdateBordersRequest
					* updates the borders of a range
					* if a field is not set in the request that means the border remains as-is
			* Filters (filter view & basic filter)
				* AddFilterViewRequest
					* adds a filter view
				* DuplicateFilterViewRequest
					* duplicates a particular filter view
				* UpdateFilterViewRequest
					* updates properties of the filter view
				* SetBasicFilterRequest
					* sets the basic filter associated with a sheet
				* ClearBasicFilterRequest
					* clears the basic filter, if any exists on the sheet
			* Data Validation
				* SetDataValidationRequest
					* sets a data validation rule to every cell in the range
					* to clear validation in a range call this with no rule specified
			* Conditional Format Rules
				* AddConditionalFormatRulesRequest
					* adds a new conditional format rule at the given index. all subsequent rules indexes are incremented
				* UpdateConditionalFormatRuleRequest
					* updates a conditional format rule at the given index
					* moves a contional format rule to another index
				* DeleteConditionalFormatRuleRequest
					* deletes a conditional format rule at the given index. all subsequent rules indexes are decremented
			* Protected Ranges
				* AddProtectedRangeRequest
					* adds a new protected range
				* UpdateProtectedRangeRequest
					* updates an existing protected range with the specified `protectedRangeId`
				* DeleteProtectedRangeRequest
					* deletes the protected range with the given ID
			* Embedded Objects (including charts)
				* AddChartRequest
					* adds a chart to a sheet in the spreadsheet
				* UpdateChartSpecRequest
					* updates a charts specifications
					* does not move or resize a chart
				* UpdateEmbeddedObjectPositionRequest
					* update an embedded objects position such as moving or resizing a chart or image
				* DeleteEmbeddedObjectRequest
					* deletes the embedded object with the given ID
			* Merges
				* MergeCellsRequest
					* merges all cells in the range
				* UnmergeCellsRequest
					* unmerges cells in the given range
			* user actions
				* AutoFillRequest
					* fills in more data based on existing data
				* CutPasteRequest
					* moves data from the source to the destination
				* CopyPasteRequest
					* copies data from the source to the destination
				* FindReplaceRequest
					* finds and replaces data in cells over a range, sheet, or all sheets
				* PasteDataRequest
					* inserts data into the spreadsheet starting at the specified coordinate
				* TextToColumnsRequest
					* splits a column of text into multiple columns based on a delimiter in each cell
				* SortRangeRequest
					* sorts data in rows based on a sort order per column
	* field masks
		* comma-delimited list of fields that you want to update
		* many of the update request require field masks
		* required to make sure only fields you want to edit are updated
		* use `*` as short-hand for updating every field
			* no value will revert the field to default state
	* responses
		* when updating a spreadsheet some kinds of requests may return responses
		* these are returned in an array with each response occupying the same index as the corresponding request
			* add responses

* how do [date and number formats work with GSA](https://developers.google.com/sheets/api/guides/formats)?
	* date-time and number formats let you control how your data appears in a sheet 
		* google provides some common formats but you can define your own
	* use the `UpdateCells` or `RepeatCell` object request of the `batchUpdates` method
	* locale is a property of the spreadsheet in `SpreadsheetProperties`
	* date and time format patterns
		* a string of token substrings that when parsed are replaced with the corresponding date-time elements
		* date and time format tokens
			* `+`
				* indicates that previous character can appear one or more times and still match the pattern
			* `h`
				* hour of the day
				* switches between 12 and 24 hour format depending on whether an am/pm indicator is present in the string
			* `hh+`
				* same as previous but with a leading 0 for 1-9
			* `m`
				* if previous token was hours or the subsequent one is seconds
					* represents minutes in the hour
				* else
					* represents the month of the year as a number
			* `mm`
				* as above but with leading 0 for both cases
			* `mmm`
				* three letter month abbreviation
			* `mmmm`
				* full month name
			* `mmmmm`
				* first letter of the month
			* `mmmmmm+`
				* full month name
			* `s`
				* seconds in the minute
			* `ss`
				* seconds in the minute with a leading 0
			* `[h+]`
				* number of elasped hours in a time duration
				* number of letters indicates minimum number of digits, adds leading 0s
			* `[m+]`
				* number of elasped minutes in a time duration
				* number of letters indicates minimum number of digits, adds leading 0s
			* `[s+]`
				* numebr of elasped seconds in a time duration
				* number of letters indicates minimum number of digits, adds leading 0s
			* `d`
				* day of the month, no leading 0 for numbers less than 10
			* `dd`
				* day of the month, with a leading 0 for numbers less than 10
			* `ddd`
				* day of the week, three letter abbreviation
			* `dddd+`
				* day of the week full name
			* `y`
				* 2-digit year
			* `yy`
				* 2-digit year
			* `yyy`
				* 4-digit year
			* `yyyy`
				* 4-digit year
			* `a/p`
				* displays `a` for AM and `p` for PM
				* changes to 12-hour format
				* if token is capitalized output is as well
			* `am/pm`
				* as above but displays `AM` or `PM` and is always capitalized
			* `0`
				* tenths of seconds 
			* `00`
				* tenths of seconds with 2 digit precision
			* `000`
				* tenths of seconds with 3 digit precision
			* `\`
				* treats the next character as a literal value 
			* `"text"`
				* displays whatever text is inside the quotation marks as a literal
	* number format patterns
		* a string or token substring that when parsed are replaced with the corresponding number representations
			* can consist of up to four sections separated by semicolons which define the separate formats used for
				* positive numbers
				* negative numbers
				* zero
				* text
			* `[positive format];[negative format];[zero format];[text format]`
			* you do not need to include all four sections
				* `[number format]`
					* used for all values
				* `[postive/zero format];[negative format]`
					* first applied to zero and positive
					* seconde to negative numbers
				* `[positive format];[negative format];[zero format]`
					* you get the idea
			* if less than 4 and more than 1 adding `[text format]` subtracts from the other format
		* parsing of a format into sections occurs prior to other parsing
	* number format tokens
		* `0`
			* represents a digit in the number
			* if the digit is an insignificant 0 it is rendered as 0
		* `#`
			* represents a digit in the number
			* insignificant 0s not rendered
		* `?`
			* represents a digit in the number
			* insignificant 0s rendered as a space
		* `.`
			* first period represents the decimal point in the number
				* if included always rendered
			* subsequent periods are rendered as literals 
		* `%`
			* appears as a literal but also causes the existing number to be multiplied by 100 before being rendered
		* `,`
			* if between two digit characters
				* groups the number by thousands
			* if it follows the digit characters 
				* scales the digits by one thousand per comma
		* `E-`
		* `E+`
		* `e-`
		* `e+`
			* renders the number in scientific notation 
		* `/`
			* if between two digits
				* treats those digit groups as a fractional format
		* `*`
			* ignored there for compatibility with excell
		* `-`
			* skips the next character and renders a space
			* used to line up number formats where the negative value is surrounded by parenthesis
		* `"text"`
			* displays whatever text is inside the quotation marks as a literal
		* `@`
			* inserts the raw text for the cell if cell has text input
	* number format meta instructions
		* each of the formats can have optional meta instructions enclosed in `[]` characters that precede the format 
		* a given section can use two meta instructions types
			* `[condition]`
				* replaces the default positive, negative, zero comparisons of the section with another conditional expression
				* `[<100]"Low";[>1000]"High";000`
					* render low for values below 100, render high for values above 1000, and 000 for anything in between
				* can only be used for the first two sections, third section used for everything else
			* `[Color] or [Color#]`
				* causes any value that is rendered by this subformat to appear with the given text color
				* `Color` valid values
					* Black
					* Blue
					* Cyan
					* Green
					* Magenta
					* Red
					* White
					* Yellow
				* `Color#` valid values
					* 0 - 56
* what are [pivot tables](https://developers.google.com/sheets/api/guides/pivot-tables)?
	* provide a way to summarize data in your spreadsheet 
		* automatically working on data
			* aggregating
			* sorting
			* counting
			* averaging
	* displays the summarized results in a new table
	* acts as a sort of query against a source data set
		* represents a processed view of the data
	* working with pivot tables
		* a pivot table definition is associated with a single cell on a sheet
			* its rendered appearance is many cells in both height and width
			* programatically located at a single cell coordinate
				* top-left hand corner of the rendered pivot table
	* adding a pivot table
		* use the `batchUpdate` method supplying an `updateCells` request
			* supply a `PivotTable` definition as the content of a cell
		```
			"updateCells": {
				"rows": {
					"values": [{
						"pivotTable": MyPivotTable
					},
					"start": {
						"sheetId": sheetId,
						"rowIndex": 0,
						"columnIndex": 0
					},
					"fields": "pivotTable"
				}
			}
		```
		* `PivotTable` type lets you specify
			* source data range
			* fields whose data will form the rows of the pivot table
			* fields whose data will form the columns of the pivot table
			* filtering and aggregation criteria
			* pivot table layout
	* modifying and deleting pivot tables
		* there are no explicit requests to modify or delete a pivote table 
			* just use `updateCells` request with different cell contents
	* use cases 
		* many different uses for pivot tables across a broad range of areas including
			* statistical analysis
			* ERP applications
			* financial reporting
			* others
		* classic use cases
			* total sales by region and quarter
			* average salary by title and gender
			* count of incifents by product and time of day
		* specific use cases
			* explore incident data for most recent 24h period
			* view/analyze aggregated data corresponding to the currently selected account
			* examine sales data for territories belonging to the current user

* what is [conditional formatting in GSA](https://developers.google.com/sheets/api/guides/conditional-format)?
	* lets you format cells so that their appearance changes dynamically according to the value they contain or to values in other cells
	* use cases
		* highlight cells above some threshold
		* format cells so their color varies with their values
		* dynamically format cells based on the content of other celss
	* conditional formatting rules
		* each spreadsheet stores a list of formatting rules and applies them in the same order that they appear in the list
		* GSA lets you add, update, delete these formatting rules
		* each rule specifies
			* a target range
				* single cell
				* range of cells
				* multiple ranges
			* type of rule
				* boolean rules
					* apply a format only if specific criteria are met
				* gradient rules
					* calculate the background color of a cell based on the value of the cell
			* conditions for triggering the rule
			* formatting to apply
	* boolean rules
		* define whether or not to apply a specific format based on a condition that evaluates to True or False
		* form
	```
		{
			"condition": {
				object(BooleanCondition)
			},
			"format": {
				object(CellFormat)
			},
		}
	```
		* condition can use one of the built-in condition types or it can use a custom formula for more complex evaluations
			* built-in rules
				* always evaluated with respect to the target cell
				* let you apply formatting according to
					* numeric thresholds
					* text comparison
					* whether a cell is populated
			* custom formula
				* a special condition type that lets you apply formatting according to an arbitrary expression 
					* allows evaluation of any cell not just the target cell
		* to define the formatting applied by a boolean rule you use a subset of the `CellFormat` type to define
			* whether or not the text in the cell is bold, italic, or strikethrough
			* the color of the text in the cell
			* the background color of the cell
	* gradient rules
		* define a range of colors that correspond to a range of values 
		* form
	```
		{
			"minpoint": {
				object(InterpolationPoint)
			},
			"midpoint": {
				object(InterpolationPoint)
			},
			"maxpoint": {
				object(InterpolationPoint)
			},
		}
	```
		* `InterpolationPoint` defines a color and its corresponding value
			* three points defines a color gradient
	* managing conditional formatting rules
		* use `BatchUpdate` to
			* add rules to the list using the `AddConditionalFormatRuleRequest`
			* replace or reorder rules in the list using the `UpdateConditionalFormatRuleRequest`
			* delete rules using the `DeleteConditionalFormatRuleRequest`
		
	


































* can [google sheets be used as a basic webscraper](https://www.benlcollins.com/spreadsheets/google-sheet-web-scraper/)?
	* holy fuck it can.



