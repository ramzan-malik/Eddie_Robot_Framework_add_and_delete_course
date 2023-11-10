*** Settings ***

Documentation    A reusbale fil similar to Baseclass that
...              that has similar function as of Baseclass

Library     SeleniumLibrary



*** Variables ***

${addcoursebatchname}                   //input[@name='course_batch_name']
${search}                               //input[@type='search']
${startdate}                            //input[@name='start_date']
${starttime}                            //input[@name='start_time']
${endtime}                              //input[@name='end_time']
${checkboxtuesday}                      //input[@value='Tue']
${checkboxthursday}                     //input[@value='Thu']
${inputpaidmax}                         //input[@name='paid_max_students']
${invoicedate}                          //input[@name='invoice_due']
${submitbtn}                            //button[@type='submit']



*** Keywords ***

Enter Course Name
	Wait Until Element Is Visible           ${addcoursebatchname}
	Input Text                              ${addcoursebatchname}           Test Course


Enter Course Grades
	Wait Until Element Is Visible           //span[text()='Select ..']
    Click Element                           //span[text()='Select ..']
	Input Text                              ${search}                                      Grade 5
	Click Element                           //li[contains(.,'Grade 5')]


Select Course Subject
	Wait Until Element Is Visible           //span[text()='Select Subject']
    Click Element                           //span[text()='Select Subject']
	Input Text                              ${search}                                      English
	Click Element                           (//li[contains(.,'English')])[last()]


Select Course Billing Code
	Wait Until Element Is Visible           //span[text()='Select Billing Code']
    Click Element                           //span[text()='Select Billing Code']
	Input Text                              ${search}                                      5 Grade
	Click Element                           //li[contains(.,'5 Grade CB(Eng-3001) - Free (7 Cycle Days - USD 0)')]


Select Course TimeZone
	Wait Until Element Is Visible           //span[text()='Select Timezone']
    Click Element                           //span[text()='Select Timezone']
	Input Text                              ${search}                                      Asia
	Click Element                           //li[contains(.,'(Asia/Karachi - GMT +05:00) Pakistan')]
	Sleep                                   3

Course Start Date
	Wait Until Element Is Visible           ${startdate}
	Input Text                              ${startdate}                                  11282023

Course Start Time
	Wait Until Element Is Visible           ${starttime}
	Input Text                              ${starttime}                                  0300PM


Course End Time
	Wait Until Element Is Visible           ${endtime}
	Input Text                              ${endtime}                                   0400PM

Select Tuesday Checkbox
	Click Element                           ${checkboxtuesday}
	Sleep                                   2


Select THursday Checkbox
	Click Element                           ${checkboxthursday}
	Sleep                                   2


Select Course Teacher
	Wait Until Element Is Visible           //span[text()='Select Teacher']
    Click Element                           //span[text()='Select Teacher']
	Input Text                              ${search}                                      Teacher ABC
	Click Element                           //li[contains(.,'(T11001) - Teacher ABC')]
	Sleep                                   2


Select Course Holidays
	Wait Until Element Is Visible           //span[text()='Select Holiday Group']
    Click Element                           //span[text()='Select Holiday Group']
	Input Text                              ${search}                                      Pakistan
	Click Element                           //li[contains(.,'Pakistan Holidays')]
	Sleep                                   4


Select Course Resources
	Wait Until Element Is Visible           (//span[text()='Select Resources'])[1]
    Sleep                                   2
    Click Element                           (//span[text()='Select Resources'])[1]
	Input Text                              ${search}                                      Student Resource
	Click Element                           //li[contains(.,'Student Resource')]
	Sleep                                   3


Select Course Teacher Resources
	Wait Until Element Is Visible           (//span[text()='Select Resources'])[1]
    Click Element                           (//span[text()='Select Resources'])[1]
	Input Text                              ${search}                                      Teacher Resource
	Click Element                           //li[contains(.,'Teacher Resource')]
	Sleep                                   2

Course Maximum Paid
	Wait Until Element Is Visible           ${inputpaidmax}
	Clear Element Text                      ${inputpaidmax}
	Sleep                                   1
	Input Text                              ${inputpaidmax}                                 10

Course Invoice Date
	Wait Until Element Is Visible           ${invoicedate}
	Input Text                              ${invoicedate}                                  11282023
	Sleep                                   2


Select 1st Frame
	Select Frame                            mce_0_ifr
	Input Text                              //body[@id='tinymce']                            test
	Sleep                                   2
	Unselect Frame


Select 2nd Frame
	Select Frame                            mce_13_ifr
	Input Text                              //body[@id='tinymce']                            test
	Sleep                                   2
	Unselect Frame


Click Submit Button
	Click Button                            ${submitbtn}








