Feature: Testing CRUD operations for APIs in petstore

Background:

* url baseUrl
* def newPetDetails = read('newPetInfo.json')

Scenario: Verifying user can get the list of available pets,post a new available pet,
update an existing available pets status and delete an existing pet
* print 'Get "available" pets'
Given path '/findByStatus?status=available'
And headers {accept: 'application/json'}
When method get
Then status 200
* print karate.pretty(response)
* match each response[*] contains { status: 'available' }

* print 'Post a new available pet to the store:'
Given headers {accept: 'application/json',Content-Type: 'application/json'}
And request newPetDetails
When method post
Then status 200
* print karate.pretty(response)
* match $ contains {id: '#notnull', status: '#(newPetDetails.status)', name: '#(newPetDetails.name)'}
* match $.category contains {id: '#(newPetDetails.category.id)', name: '#(newPetDetails.category.name)'}
* match $.tags[0] contains {id: '#(newPetDetails.tags[0].id)', name: '#(newPetDetails.tags[0].name)'}
* match $.photoUrls[0] == '#(newPetDetails.photoUrls[0])'
* def newPetID = $.id

* print 'Verify the pet has been added with ID:', newPetID
Given path '/',newPetID
When method get
Then status 200
And match $.status == 'available'

* print 'Updating the status for Pet with ID:', newPetID
* set newPetDetails.id = newPetID
* set newPetDetails.status = 'sold'
And request newPetDetails
When method put
Then status 200
* print karate.pretty(response)
* match $ contains {id: '#(newPetID)', status: 'sold', name: '#(newPetDetails.name)'}
* match $.category contains {id: '#(newPetDetails.category.id)', name: '#(newPetDetails.category.name)'}
* match $.tags[0] contains {id: '#(newPetDetails.tags[0].id)', name: '#(newPetDetails.tags[0].name)'}
* match $.photoUrls[0] == '#(newPetDetails.photoUrls[0])'

* print 'Verify the status has been updated to sold for ID:', newPetID
Given path '/',newPetID
When method get
Then status 200
And match $.status == 'sold'

* print 'Deleting Pet with ID:', newPetID
Given path '/',newPetID
And request newPetDetails
When method delete
Then status 200
* print karate.pretty(response)
* def petIDInStringformat = newPetID+''
* match $ contains {code: 200, type: 'unknown', message: '#(petIDInStringformat)'}

* print 'Verify the pet has been deleted with ID:', newPetID
Given path '/',newPetID
When method get
Then status 404
* match $ contains {code: 1, type: 'error', message: 'Pet not found'}


