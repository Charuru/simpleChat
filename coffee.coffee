Messages = new Meteor.Collection "messages"
if Meteor.isClient
	window.Messages = Messages

	Template.messages.messages = ->
		Messages.find({}, {sort: {time: -1}})
	
	Template.entry.events = 'keyup #messageBox': (event) ->
		if event.type == "keyup" && event.which == 13
			new_message = $("#messageBox")
			name = $("#name")
			console.log "Name: #{ name.val() } Message: #{ new_message.val() } Date: #{ new Date() }"

			Messages.insert
				name: name.val(),
				message: new_message.val(),
				created: new Date()

			new_message.val("")
			new_message.focus()

			$("#chat").scrollTop $("#chat")[0].scrollHeight

			
if Meteor.isServer
	console.log "This is the server"
