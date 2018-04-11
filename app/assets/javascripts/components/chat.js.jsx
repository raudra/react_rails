var Chat = React.createClass({
  render(){
  	var items = this.props.data.map((user) => {
  			return(
				  		<table className="table table-bordered">
				  			<NewChat 
				  				user={user}
				  			/>
				  		</table>
				  	)		
				});	
  	return (
			<div>
				{items}
			</div>
		)
	}
});	