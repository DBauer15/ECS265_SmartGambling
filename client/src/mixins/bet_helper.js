export default {
    data() {
        return {
            type_number_to_name: [
                ['Red', 'Black'],
                ['Odd', 'Even'],
                ['High', 'Low'],
                ['1st 12', '2nd 12', '3rd 12'],
                ['1st Column', '2nd Column', '3rd Column'],
                ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36'],
                ['Split 1/2', 'Split 2/3', 'Split 4/5', 'Split 5/6', 'Split 7/8', 'Split 8/9', 'Split 10/11', 'Split 11/12', 'Split 13/14', 'Split 14/15', 'Split 16/17', 'Split 17/18', 'Split 19/20', 'Split 20/21', 'Split 22/23', 'Split 23/24', 'Split 25/26', 'Split 26/27', 'Split 28/29', 'Split 29/30', 'Split 31/32', 'Split 32/33', 'Split 34/35', 'Split 35/36', 
                'Split 1/4', 'Split 4/7', 'Split 7/10', 'Split 10/13', 'Split 13/16', 'Split 16/19', 'Split 19/22', 'Split 22/25', 'Split 25/28', 'Split 28/31', 'Split 31/34', 
                'Split 2/5', 'Split 5/8', 'Split 8/11', 'Split 11/14', 'Split 14/17', 'Split 17/20', 'Split 20/23', 'Split 23/26', 'Split 26/29', 'Split 29/32', 'Split 32/35',
                'Split 3/6', 'Split 6/9', 'Split 9/12', 'Split 12/15', 'Split 15/18', 'Split 18/21', 'Split 21/24', 'Split 24/27', 'Split 27/30', 'Split 30/33', 'Split 33/36'],
                [],
                ['Corner 1/2/4/5', 'Corner 4/5/7/8', 'Corner 7/8/10/11', 'Corner 10/11/13/14', 'Corner 13/14/16/17', 'Corner 16/17/19/20', 'Corner 19/20/22/23', 'Corner 22/23/25/26', 'Corner 25/26/28/29', 'Corner 28/29/31/32', 'Corner 31/32/34/35', 
                'Corner 2/3/5/6', 'Corner 5/6/8/9', 'Corner 8/9/11/12', 'Corner 11/12/14/15', 'Corner 14/15/17/18', 'Corner 17/18/20/21', 'Corner 20/21/23/24', 'Corner 23/24/26/27', 'Corner 26/27/29/30', 'Corner 29/30/32/33', 'Corner 32/33/35/36']
            ],
        
            board_to_v_split: [
                [46,47,48,49,50,51,52,53,54,55,56],
                [35,36,37,38,39,40,41,42,43,44,45],
                [24,25,26,27,28,29,30,31,32,33,34]
            ],
        
            board_to_h_split: [
                [1,3,5,7,9,11,13,15,17,19,21,23],
                [0,2,4,6,8,10,12,14,16,18,20,22],
            ],
        
            board_to_corner: [
                [11,12,13,14,15,16,17,18,19,20,21],
                [0,1,2,3,4,5,6,7,8,9,10]
            ],
        }
    }
}