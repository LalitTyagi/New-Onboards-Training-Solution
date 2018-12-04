class Main extend Component {
  constructor(props){
    super(props);
    this.state = {
    scoreP1 : 0,
    scoreP2 : 0, 
//     currentScoreP1 : 0,
//     currentScoreP2 : 0, 
    roundScore : 0, 
    activePlayer : 0, 
    gamePlaying : true;
    }
  }
  render() {
    return(
      <div className="wrapper clearfix">
        <div className="player-0-panel active">
          <div className="player-name" id="name-0">Player 1</div>
          <div className="player-score" id="score-0">43</div>
          <div className="player-current-box">
            <div className="player-current-label">Current</div>
            <div className="player-current-score" id="current-0">11</div>
          </div>
        </div>
        <div className="player-1-panel">
          <div className="player-name" id="name-1">Player 2</div>
          <div className="player-score" id="score-1">72</div>
            <div className="player-current-box">
              <div className="player-current-label">Current</div>
              <div className="player-current-score" id="current-1">0</div>
           </div>
        </div>
              
            <button className="btn-new"><i class="ion-ios-plus-outline"></i>New game</button>
            <button className="btn-roll"><i class="ion-ios-loop"></i>Roll dice</button>
            <button className="btn-hold"><i class="ion-ios-download-outline"></i>Hold</button>
            
            <input type="text" placeholder="Enter Final score" className="final-score">
            
            <img src="dice-5.png" alt="Dice" className="dice" id="dice">
        </div>
    );
  }
}
