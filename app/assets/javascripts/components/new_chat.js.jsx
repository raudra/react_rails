var NewChat = React.createClass({
	getInitialState(){
    	this.state={show: false}
    	return this
 	},
	handleClick(e){
		e.preventDefault();
		data = {
						chat_user: this.props.user.id,
						new_con: this.refs.new_chat.value
					 };
		$.ajax({ 
						url: '/users/new_conv', 
						type: 'POST', 
						data: data, 
						success: (response) => { 
																			// if(this.props.user.chats
																			this.props.user.chats.push(
																														 {
																														 	"msg": this.refs.new_chat.value,
																														 	"to": this.props.user.id
																															}
																														 )
																			this.refs.new_chat.value = null;													
																	} 
					});
	},
	handleUserClick(e){
		this.setState({
      show: !this.state.show
    });
	},
	render(){
		var tss =  {width: "50%"} 
		var tdss = {width: "10%"} 
		return(
				<tr>
					<td style={tdss}>
						<a href='#' 
							 onClick={this.handleUserClick}>
							{this.props.user.name}
						</a>	
					</td>
					{this.state.show &&
						<td style={tss}>
							<textarea key={this.props.user.id} 
												placeholder="Start your conversation" 
												type="text" 
												ref='new_chat'
												style={tss}
												/>
							<br></br>					
							<button onClick={this.handleClick}>
								submit
							</button>
						</td>		
					}
					{
						this.state.show &&	
						<td>
						<Conv
							user = {this.props.user}
						/>
						</td>
					}	
					
			</tr>
		)	
	}
});