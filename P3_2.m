deck = zeros(1, 52);
for i = 1: 52
    deck(i) = i;
end
straightFlush = 0; fourofaKind = 0; fullHouse = 0; flush = 0; straight = 0;
threeofaKind = 0; twoPairs = 0; onePair = 0; highCard = 0;
color = zeros(1, 5); number = zeros(1, 5);
for times = 1 : 5000000
    for card = 1 : 51       %random shuffle of the deck
       index = floor((52-card) * rand());
       temp = deck(card);
       deck(card) = deck(index+card);
       deck(index+card) = temp;
    end
    for k = 1 : 5                               % get the first 5 of the deck as the possible hand
        color(k) = ceil(deck(k) / 13);          % get the color of the cards
        number(k) = mod(deck(k)-1, 13) + 1;     % get the number of the cards
    end
    handsColor = sort(color); handsNumber = sort(number);
    if((handsColor(5) == handsColor(1)) && (handsNumber(5) - handsNumber(1) == 4))
        straightFlush = straightFlush + 1;
    elseif((handsNumber(4) == handsNumber(1)) || (handsNumber(5) == handsNumber(2)))
        fourofaKind = fourofaKind + 1;
    elseif((handsNumber(1) == handsNumber(3) && handsNumber(4) == handsNumber(5)) || (handsNumber(1) == handsNumber(2) && handsNumber(3) == handsNumber(5)))
        fullHouse = fullHouse + 1;
    elseif(handsColor(5) == handsColor(1))
        flush = flush + 1;
    elseif(handsNumber(5) - handsNumber(1) == 4)
        straight = straight + 1;
    elseif((handsNumber(1) == handsNumber(3)) || (handsNumber(2) == handsNumber(4)) || (handsNumber(3) == handsNumber(5)))
        threeofaKind = threeofaKind + 1;
    elseif((handsNumber(1) == handsNumber(2) && handsNumber(3) == handsNumber(4)) || (handsNumber(1) == handsNumber(2) && handsNumber(4) == handsNumber(5)) || (handsNumber(2) == handsNumber(3) && handsNumber(4) == handsNumber(5)))
        twoPairs = twoPairs + 1;
    elseif((handsNumber(1) == handsNumber(2)) || (handsNumber(2) == handsNumber(3)) || (handsNumber(3) == handsNumber(4)) || (handsNumber(4) == handsNumber(5)))
        onePair = onePair + 1;
    else
        highCard = highCard + 1;
    end
end
p1 = straightFlush / 5000000
p2 = fourofaKind / 5000000
p3 = fullHouse / 5000000
p4 = flush / 5000000
p5 = straight / 5000000
p6 = threeofaKind / 5000000
p7 = twoPairs / 5000000
p8 = onePair / 5000000
p9 = highCard / 5000000
p = p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8 + p9      % the total possibility is 1