class Player
  def hand
    loop do
      puts "0~2の数字を入力してください"
      puts "0:グー,1:チョキ,2:パー"
      input_hand = gets.chomp
      if input_hand == "0" || input_hand == "1" || input_hand == "2"
      return input_hand
      else 
      end
    end
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する 
    rand(0..2).to_s
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    jankens = ["グー", "チョキ", "パー"]
    if (player_hand == enemy_hand)
      puts "あいこ" 
      return next_game = true
    elsif (player_hand == "0" && enemy_hand == "1") || (player_hand == "1" && enemy_hand == "2") || (player_hand == "2" && enemy_hand == "0")
      puts "相手の手:#{jankens[enemy_hand.to_i]}あなたの勝ちです"
      return next_game = false
    elsif (player_hand == "0"&& enemy_hand == "2") || (player_hand == "1" && enemy_hand == "0") || (player_hand == "2" && enemy_hand == "1")
      puts "あなたの負けです"
      return next_game = false
    end
  end
end
      
class GameStart
  # selfを使用することで、GameStartをインスタンス化することなく、クラス名を使ってjankenponメソッドを呼び出せます。
  def self.jankenpon
    # 変数「player」にPlayerをインスタンス化したものを代入します。
    player = Player.new
    # 変数「enemy」にEnemyをインスタンス化したものを代入します。
    enemy = Enemy.new
    # 変数「janken」にJankenをインスタンス化したものを代入します。
    janken = Janken.new
    # 変数「next_game」に「true」を代入しましょう。
    # 「next_game」が「false」だと繰り返し処理を終了し、「true」だと繰り返し処理を継続します。
    next_game = true
    while next_game == true
      # 変数「next_game」にじゃんけんを実行して返ってきた値(戻り値)を代入します。
      #「janken.pon(player.hand, enemy.hand)」でじゃんけんを実行しています。
      next_game = janken.pon(player.hand, enemy.hand)
    end
  end
end
      # クラス名を使ってjankenponメソッドを呼び出します。
GameStart.jankenpon
    
    
    