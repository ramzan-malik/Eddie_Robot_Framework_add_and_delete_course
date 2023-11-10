*** Settings ***

Documentation       End to End Testing Flow
Library             SeleniumLibrary
Library             OperatingSystem
Library             Collections             # for "Append to List" keyword
Suite Setup         Open Chrome Browser With URL
#Suite Teardown       Close Browser Session         #it will always run after text execution
Resource            ../PageObjects/GenericPage.robot
Resource            ../PageObjects/AddACourse.robot
Library             ../custom_library/MyLibrary.py




*** Variables ***

${url_to_verify}
${success_block_element_to_verify}              //li[@class='breadcrumb-item active']
${success_block_btn_element_to_verify}          //a[@class='btn btn-success']
${XPATH}                                        //tr[@role='row']




*** Test Cases ***

Go to Website and Perform Login in Chrome Browser and Verify the Link

	GenericPage.Enter Email Id and Password to Login              ${username}           ${valid_password}
	Verify User Successfully Logged In
	Verify Link and Success Block Element of the page             https://app-qa.nykey.org/course_batches/create              Add Course Batch
	Sleep    3


Adding A Course -> add_course_batch

    Sleep                                           2
	AddACourse.Enter Course Name
	AddACourse.Enter Course Grades
	AddACourse.Select Course Subject
	AddACourse.Select Course Billing Code
	AddACourse.Select Course TimeZone
	AddACourse.Course Start Date
	AddACourse.Course Start Time
	AddACourse.Course End Time
	AddACourse.Select Tuesday Checkbox
	Sleep                                           2
	AddACourse.Select Thursday Checkbox
	Sleep                                           2
	AddACourse.Select Course Teacher
	AddACourse.Select Course Holidays
	AddACourse.Select Course Resources
	AddACourse.Select Course Teacher Resources
	AddACourse.Course Maximum Paid
	AddACourse.Course Invoice Date
	Execute JavaScript                                  window.scrollTo(0, document.body.scrollHeight)
	Sleep                                               2
	AddACourse.Select 1st Frame
	Sleep                                               2
	AddACourse.Select 2nd Frame
    Sleep                                               2
    AddACourse.Click Submit Button
    Sleep                                               4
    Page Should Contain                                 Success


Verify Course Batch List -> course_batch_list

    Sleep    3
	Verify Link and Success Block Element of the page             https://app-qa.nykey.org/course_batches              Course Batch List
	Sleep    3

Perform Delete on all Added courses
	Sleep      3
	Delete All Courses




*** Keywords ***

Verify User Successfully Logged In
	${current_url} =        Get Location
	Should Contain          ${current_url}       /home


Verify Link and Success Block Element of the page

	[Arguments]                             ${url_to_verify}                        ${success_block_element_to_verify}
	Go To                                   ${url_to_verify}
	Sleep                                   2
	Wait Until Page Contains                ${success_block_element_to_verify}
	Page Should Contain                     ${success_block_element_to_verify}