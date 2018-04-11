# @Users = React.createClass
# 	getInitialState: ->
# 		users: @props.data
#   getDefaultProps: ->
#     users: []
#   startConversation:->  
# 	render:->
# 		React.DOM.div
#       className: 'records'
#       React.DOM.table
#         className: 'table table-bordered'
#         React.DOM.thead null
#         	React.DOM.tr null,
#             React.DOM.th null, 'Active Users'
#             React.DOM.th null
#           React.DOM.tbody null,
#             for user in @state.users 
#               React.DOM.tr null,
#                 React.DOM.td  null , user.name
#                 React.DOM.td  null ,
#                   React.DOM.a 
#                     className: 'btn btn-default'
#                     onclick: @startConversation
#                     'start'
                  

#                                     