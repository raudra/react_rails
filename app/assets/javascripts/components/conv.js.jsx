var Conv = React.createClass({
	getInitialState: function (){
		// return (
					$.ajax({ 
						url: '/users/convs?user_id='+this.props.user.id, 
						type: 'get', 
						success: (response) => { 
																			console.log("after")
																			this.props.user['chats'] = response;
																	 } 
					});
			return this		
			// )	
	},
	render(){
		var b_style = { border: "none"}
		if(this.props.user.chats != undefined){
			var items = this.props.user.chats.map((chat) => {
				console.log(chat)
				return(
			  		<table className="table table-bordered" style={b_style}>
			  			<tbody>
			  				{ 
			  					this.props.user.id == chat.to &&
			  					<tr>
											<td>
						  					{chat.msg}
						  				</td>	
						  				<td style={b_style}>
						  				</td>
						  		</tr>		
						  	}
								{ 
			  					this.props.user.id != chat.to &&
			  					<tr>
						  				<td style={b_style}>
						  				</td>
											<td>
						  					{chat.msg}
						  				</td>	
						  		</tr>		
						  	}
									
			  			</tbody>
			  		</table>
			  	)		
			});	
		}
		return(
				<div>
					{ 
						items != undefined &&
						items
					}	
				</div>
		)
	}
});