int[][][] values= {{{2,1},{0,1}},{{1,2},{1,0}},{{0,1},{2,1}},{{1,0},{1,2}}};
int[][][] top_Layer={{{4,6,3},{0,5,1},{2,6,3}},{{1,0,4},{0,0,5},{3,0,6}},{{5,4,1},{0,2,3},{6,4,1}}};
int[][][] middle_Layer={{{5,4,0},{0,2,0},{6,4,0}},{{3,0,0},{0,0,0},{1,0,0}},{{6,2,0},{0,4,0},{5,2,0}}};
int[][][] bottom_Layer={{{6,2,1},{0,4,3},{5,2,1}},{{1,0,2},{0,0,6},{3,0,5}},{{2,5,3},{0,6,1},{4,5,3}}};
 // red-1, green 2, orange-3, blue-4,yellow-5 , white-6
boolean middle_white=true;

int[][] sweep={ {1,2}, {0,2} , {1,2} , {0,2}, {0,1} ,{0,1} };
int[][][] sides= new int[6][3][3];
void sidesDef(){
int[][][] sides1={  {
                 {top_Layer[2][2][0], top_Layer[1][2][0],top_Layer[0][2][0]},
                 {middle_Layer[2][2][0], middle_Layer[1][2][0], middle_Layer[0][2][0]},
                 {bottom_Layer[2][2][0], bottom_Layer[1][2][0], bottom_Layer[0][2][0]}
                                                                                           },
             {
                 {top_Layer[0][2][1], top_Layer[0][1][1],top_Layer[0][0][1]},
                 {middle_Layer[0][2][1], middle_Layer[0][1][1], middle_Layer[0][0][1]},
                 {bottom_Layer[0][2][1], bottom_Layer[0][1][1], bottom_Layer[0][0][1]}
                                                                                           },
             {
                 {top_Layer[0][0][0], top_Layer[1][0][0],top_Layer[2][0][0]},
                 {middle_Layer[0][0][0], middle_Layer[1][0][0], middle_Layer[2][0][0]},
                 {bottom_Layer[0][0][0], bottom_Layer[1][0][0], bottom_Layer[2][0][0]}
                                                                                           },
             {
                 {top_Layer[2][0][1], top_Layer[2][1][1],top_Layer[2][2][1]},
                 {middle_Layer[2][0][1], middle_Layer[2][1][1], middle_Layer[2][2][1]},
                 {bottom_Layer[2][0][1], bottom_Layer[2][1][1], bottom_Layer[2][2][1]}
                                                                                           } ,  
             {
                 {top_Layer[0][0][2], top_Layer[0][1][2],top_Layer[0][2][2]},
                 {top_Layer[1][0][2], top_Layer[1][1][2], top_Layer[1][2][2]},
                 {top_Layer[2][0][2], top_Layer[2][1][2], top_Layer[2][2][2]}
                                                                                           } , 
             {
                 {bottom_Layer[0][0][2], bottom_Layer[0][1][2],bottom_Layer[0][2][2]},
                 {bottom_Layer[1][0][2], bottom_Layer[1][1][2], bottom_Layer[1][2][2]},
                 {bottom_Layer[2][0][2], bottom_Layer[2][1][2], bottom_Layer[2][2][2]}
                                                                                            } 
                                                                                           



};

for(int i=0; i<6; i++){
    for(int j=0; j<3; j++){
          for(int k=0; k<3; k++){
        sides[i][j][k]=sides1[i][j][k] ;   
          }}}

}

//cloclwise 1       counterclockwise -1
void rotate(int direction, int side ){
  if(side==0){
    side=4;
  }
  int[][][] rotate_Layer= new int[3][3][3];
  if(side==5 ){
    rotate_Layer=top_Layer;
  }
  else if(side==6 ){
    rotate_Layer=bottom_Layer;
  }
  else if(side==1){
     for(int i=0; i<3;i++){
     rotate_Layer[0][i]= top_Layer[2-i][2];
     rotate_Layer[1][i]= middle_Layer[2-i][2];
     rotate_Layer[2][i]= bottom_Layer[2-i][2];
  }
  }
  
  else if(side==3){
     for(int i=0; i<3;i++){
     rotate_Layer[0][i]= top_Layer[i][0];
     rotate_Layer[1][i]= middle_Layer[i][0];
     rotate_Layer[2][i]= bottom_Layer[i][0];
  }
  }
  else if(side==2){
     for(int i=0; i<3;i++){
     rotate_Layer[0][i]= top_Layer[0][2-i];
     rotate_Layer[1][i]= middle_Layer[0][2-i];
     rotate_Layer[2][i]= bottom_Layer[0][2-i];
  }
  }
  else if(side==4){
     for(int i=0; i<3;i++){
     rotate_Layer[0][i]= top_Layer[2][i];
     rotate_Layer[1][i]= middle_Layer[2][i];
     rotate_Layer[2][i]= bottom_Layer[2][i];
  }
  }
    int[][] first_row=new int[3][3];
    first_row[0]=rotate_Layer[0][0];
    first_row[1]=rotate_Layer[0][1];
    first_row[2]=rotate_Layer[0][2];
  
  
  if(direction==1){
    
   
    rotate_Layer[0][2]=rotate_Layer[0][0];
    rotate_Layer[0][1]=rotate_Layer[1][0];
    rotate_Layer[0][0]=rotate_Layer[2][0];
    rotate_Layer[1][0]=rotate_Layer[2][1];
    rotate_Layer[2][0]=rotate_Layer[2][2];
    rotate_Layer[2][1]=rotate_Layer[1][2];
    rotate_Layer[2][2]=first_row[2];
    rotate_Layer[1][2]=first_row[1];
   
    
  }
  else if(direction==-1){
    
   
    rotate_Layer[0][0]=rotate_Layer[0][2];
    rotate_Layer[0][1]=rotate_Layer[1][2];
    rotate_Layer[0][2]=rotate_Layer[2][2];
    rotate_Layer[1][2]=rotate_Layer[2][1];
    rotate_Layer[2][2]=rotate_Layer[2][0];
    rotate_Layer[2][1]=rotate_Layer[1][0];
    rotate_Layer[2][0]=first_row[0];
    rotate_Layer[1][0]=first_row[1];
    
  }
  
  
   for(int i=0; i<3; i++){
      for(int j=0; j<3; j++){
        int x=rotate_Layer[i][j][sweep[side-1][0]];
        rotate_Layer[i][j][sweep[side-1][0]]=rotate_Layer[i][j][sweep[side-1][1]];
        rotate_Layer[i][j][sweep[side-1][1]]=x;
      }
 }
 //for(int i=0; i<3;i++){
 //   print(rotate_Layer[i][0][2]);
 //   print("/");
 //   print(rotate_Layer[i][1][2]);
 //   print("/");
 //   println(rotate_Layer[i][2][2]);
 // }
 
  
 
 /////////////////update////////////////////
   
  if(side==5 ){
    top_Layer=rotate_Layer;
  }
  else if(side==6 ){
    bottom_Layer=rotate_Layer;
  }
  else if(side==1){
     for(int i=0; i<3;i++){
     top_Layer[2-i][2]=rotate_Layer[0][i];
     middle_Layer[2-i][2]=rotate_Layer[1][i];
     bottom_Layer[2-i][2]=rotate_Layer[2][i];
  }
  }
  
  else if(side==3){
     for(int i=0; i<3;i++){
     top_Layer[i][0]=rotate_Layer[0][i];
     middle_Layer[i][0]=rotate_Layer[1][i];
     bottom_Layer[i][0]=rotate_Layer[2][i];
  }
  }
  else if(side==2){
     for(int i=0; i<3;i++){
     top_Layer[0][2-i]=rotate_Layer[0][i];
     middle_Layer[0][2-i]=rotate_Layer[1][i] ;
     bottom_Layer[0][2-i]=rotate_Layer[2][i];
  }
  }
  else if(side==4){
     for(int i=0; i<3;i++){
     top_Layer[2][i]=rotate_Layer[0][i];
     middle_Layer[2][i]=rotate_Layer[1][i];
     bottom_Layer[2][i]=rotate_Layer[2][i];
  }}
 
  sidesDef();
    
}









void middle_WhiteCross(){
  while(true){
    if(middle_white==false){
    break;}
    middle_white=false;
    for(int i=1; i<=4; i++){
      if(sides[i-1][1][0]==6){
        while(sides[4][values[i-1][0][0]][values[i-1][0][1]]==6){
          rotate(1,5);
        }
        int q=i-1;
        if(q==0){
          q=4;
        }
       rotate(-1,q);
       middle_white=true;
      }
      if(sides[i-1][1][2]==6){
       while(sides[4][values[i-1][1][0]][values[i-1][1][1]]==6){
          rotate(1,5);
        }
        int p=i+1;
        if(p==5){
          p=1;
        }
       rotate(1,p);
        middle_white=true;
      }
      
       
    }
    
    
    
    
    
  }
  
  
}







  
  
  
  
  
void sideShow(int[][] colour,int l,int h){
  
  // red-1, green 2, orange-3, blue-4,yellow-5 , white-6
  
  
int[][] colour_codes={{255,0,0}, {0,255,0}, {255,128,0}, {0,0,255},{255,255,0},{255,255,255}};
  int x=100;
  for(int i=0;i<3;i++){
    for(int j=0;j<3;j++){
    fill(colour_codes[colour[i][j]-1][0],colour_codes[colour[i][j]-1][1],colour_codes[colour[i][j]-1][2]);
  rect(l+j*x,h+i*x,x,x);
  

}
}

}
int[][]side_locations={{600,300},{300,0},{0,300},{300,600},{300,300},{900,300}};
int[][] colour=sides[5];
void showsides(){
for(int i=0;i<6;i++){
  sideShow(sides[i],side_locations[i][0],side_locations[i][1]);
}}
float xmag, ymag = 0;
float newXmag, newYmag = 0; 
void setup(){
   
     //background(0);
    size(1200,900,P3D);
    noStroke();
    sidesDef();
    showsides();
    //delay(1000);
    //sideShow(colour);
  //  delay(10000);
 // rotate(1,5);
 //   rotate(-1,4);
    middle_WhiteCross();
    
    top_WhiteCross();
    bottom_WhiteCross();
 //   for(int j=0; j<4;j++){
 whiteCross();
//whiteCross();//}
  // colour=sides[5];
  top_WhiteCorners();
  bottom_WhiteCorners();

  middle_WhiteCorners();

    final_middle();
      
    yellow_cross();
    
    configure_topCorners();
    
  set_topcorners();
 
  top_cornerfix();
  
  final_top();
// showsides();
   //sideShow(colour,10,30);
  }
  
  void draw(){
    background(0.5);
  
 
  
  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;
  
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { 
    xmag -= diff/4.0; 
  }
  
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { 
    ymag -= diff/4.0; 
  }
  
  
  

for(int i=-1;i<2;i++){
  for(int j=-1;j<2;j++){
    for(int k=-1;k<2;k++){
      int[] t= new int[3];
      if(i==-1){
        t=top_Layer[j+1][k+1];
      }
      else if(i==0){
        t=middle_Layer[j+1][k+1];
      }
      else{
        t=bottom_Layer[j+1][k+1];
      }
    sidesShow(k,i,j,t);
    }}} 
  //  sideShow(colour);
  }
  
  boolean top_white=true;
  
  void top_WhiteCross(){
     while(true){
    if(top_white==false){
    break;}
    top_white=false;
    for(int i=1; i<=4; i++){
      if(sides[i-1][0][1]==6){
    
          rotate(1,i);       
   
       top_white=true;
       middle_WhiteCross();
      }}}}
      
      
boolean bottom_white1=true;
 boolean bottom_white2=true; 
  void bottom_WhiteCross(){
     while(true){
    if(bottom_white1==false && bottom_white2==false){
    break;}
    bottom_white1=false;
    bottom_white2=false;
    for(int i=1; i<=4; i++){
      if(sides[i-1][2][1]==6){
    
          rotate(-1,i);       
   
       bottom_white1=true;
       middle_WhiteCross();
      }
    
  }

 for(int i=1; i<=4; i++){
      if(sides[5][bottom_values[i-1][0]][bottom_values[i-1][1]]==6){
    
          rotate(-1,i);       
   
       bottom_white2=true;
       middle_WhiteCross();
      }
    
  }



}}

int[][] bottom_values={{1,2},{0,1},{1,0},{2,1}};


void whiteCross(){
 for(int a=1; a<=4; a++){
     while(sides[a-1][1][1]!=sides[a-1][0][1] || sides[4][bottom_values[a-1][0]][bottom_values[a-1][1]]!=6){
          rotate(1,5);
        }
    rotate(1,a); 
    rotate(1,a);
 }
}
int[][] index={{0,2},{0,0},{2,0},{2,2}};
 
 
void top_WhiteCorners(){
  boolean whiteCorner=true;
  while(true){
    whiteCorner=false;
  for(int a=0; a<=3; a++){
    if(top_Layer[index[a][0]][index[a][1]][0]==6 || top_Layer[index[a][0]][index[a][1]][1]==6 || top_Layer[index[a][0]][index[a][1]][2]==6){
      int[] rather_white=new int[2];
      int l=0;
      for(int k=0; k<3; k++){
        if(top_Layer[index[a][0]][index[a][1]][k]==6){
          continue;
        }
        rather_white[l]=top_Layer[index[a][0]][index[a][1]][k];
        l++;
      }
      int k1=a;
      int p=k1+1;
   if(p==4){
     p=0;
   }
     while( ((rather_white[0]!=sides[k1][1][1]) || (rather_white[1]!=sides[p][1][1])) && ((rather_white[1]!=sides[k1][1][1]) || (rather_white[0]!=sides[p][1][1]))){
       
          rotate(-1,5);
          k1++;
          p++;
          if(k1==4){
     k1=0;}
     if(p==4){
     p=0;
   }}
        
        
     
   while(sides[k1][2][2]!=sides[k1][1][1] || sides[p][2][0]!=sides[p][1][1] || bottom_Layer[index[k1][0]][index[k1][1]][2]!=6){
     right_move(k1+1);
    }
    whiteCorner=true;
      }
    
  }
  if(whiteCorner==false){
    break;
  }
}}
   
 
  
 void right_move(int side1){//realside
   if(side1==4){
     side1=0;
   }
   rotate(1,side1+1);
   rotate(1,5);
   rotate(-1,side1+1);
   rotate(-1,5);
 }
 
 void left_move(int side2){
   if(side2==1){
     side2=5;
   }
   rotate(-1,side2-1);
   rotate(-1,5);
   rotate(1,side2-1);
   rotate(1,5);
 }
 
 
 
 void bottom_WhiteCorners(){
   
    for(int a=0; a<=3; a++){
      int g=a+1;
      if(g==4){
        g=3;
      }
      if(sides[g][1][1]!=sides[g][2][0] || sides[a][1][1]!= sides[a][2][2] || top_Layer[index[a][0]][index[a][1]][2]!=6){
        right_move(g);
    }
    top_WhiteCorners();
   
 }}
 int[][] index1={{1,2},{0,1},{1,0},{2,1}};
int[] d1={0,1,0,1};
 void middle_WhiteCorners(){
  boolean middlewhiteCorner=true;
  while(true){
    middlewhiteCorner=false;
  for(int a=0; a<=3; a++){
    if(top_Layer[index1[a][0]][index1[a][1]][0]!=5 && top_Layer[index1[a][0]][index1[a][1]][1]!=5 && top_Layer[index1[a][0]][index1[a][1]][2]!=5){
     
      int k1=a;
      
     while(top_Layer[index1[k1][0]][index1[k1][1]][d1[k1]]!= sides[k1][1][1] ){
       
          rotate(-1,5);
          k1++;
          //println(a);
          if(k1==4){
     k1=0;}
    
   }
   int p=k1+1;
   if(p==4){
   
   p=0;}
   
   if(top_Layer[index1[k1][0]][index1[k1][1]][2]== sides[p][1][1]){
   
   rotate(1,5);
   right_move(k1+1);
   left_move(p+1);
   
   
    }
    
    else{
   
   rotate(-1,5);
   int q=k1-1;
   if(q==-1){
   q=3;}
   left_move(k1+1);
   right_move(q+1);
   
    }
  middlewhiteCorner=true;
}
        
  }
   
  if(middlewhiteCorner==false){
    break;
  }
}
}

void final_middle(){
  for(int k=0;k<=3;k++){
    if(sides[k][1][2]!=sides[k][1][1]){
      
      int k1=k;
      int p1=k1+1;
      if(p1==4){
        p1=0;
      }
      rotate(1,5);
   right_move(k1+1);
   left_move(p1+1);
      
      middle_WhiteCorners();
      
      
      
    }
  }}
void yellow_cross(){
  if(sides[4][0][1]== sides[4][2][1] && sides[4][2][1]==5 && sides[4][1][0]!= sides[4][1][2]){
    yellow_cross1(1);
  }
  else if(sides[4][0][1]!= sides[4][2][1] && sides[4][1][0]== sides[4][1][2] && sides[4][1][2]==5 ){
    yellow_cross1(2);
  }
  else if(sides[4][0][1]== sides[4][1][0] && sides[4][1][0]==5){
    yellow_cross2(4);
  }
  else if(sides[4][1][0]== sides[4][2][1]&& sides[4][2][1]==5){
    yellow_cross2(1);
  }
  else if(sides[4][2][1]== sides[4][1][2]&& sides[4][1][2]==5){
    yellow_cross2(2);
  }
  else if(sides[4][1][2]== sides[4][0][1] && sides[4][0][1]==5){
    yellow_cross2(3);
  }
  if(sides[4][0][1]!= 5 ||  sides[4][2][1]!=5  ||  sides[4][1][0]!=5 || sides[4][1][2]!=5){
    yellow_cross1(0);
  }
  
  
  
}
void yellow_cross1(int side3){
  
 rotate(1,side3);
 right_move(side3);
  rotate(-1,side3);

}

void yellow_cross2(int side3){
  
 rotate(1,side3);
 right_move(side3);
  right_move(side3);
  rotate(-1,side3);

}
int[][] relate={{3,2,0},{3,4,0},{1,4,0},{1,2,0}};
boolean[] result=new boolean[4];
void compair(){

int[][] compairing={top_Layer[0][0],top_Layer[2][0],top_Layer[2][2],top_Layer[0][2]};
for(int i=0;i<4;i++){
  int[] t=new int[2];
  for(int j=0;j<2;j++){
    for(int k=0;k<3;k++){
      if(relate[i][j]==compairing[i][k]){
        t[j]=1;
        break;
      }
  }}
 if(t[0]==1 && t[1]==1){
   result[i]=true;
  
 }
 else{
   result[i]=false;
   
 }
 
}
}

void configure_topCorners(){
  //
  int count=0;
  compair();
  for(int i=0; i<4;i++){
    if(result[i]==true){
      count++;
    }
  }
  while(count<=1){
    count=0;
   
    rotate(-1,5);
     compair();
    for(int i=0; i<4;i++){
    if(result[i]==true){
      count++;
      
    }
  }
  }
 if((result[0]==result[2] && result[1]==false)||( result[1]==result[3] && result[0]==false)){
  move_two(1,2);

  configure_topCorners();
} 
}

void set_topcorners(){
 
if(result[0]==true && result[1]==true && result[2]==false){
  
 move_two(4,1);
 configure_topCorners();

 
}
else if(result[1]==true && result[2]==true && result[3]==false){
  move_two(1,2);
  
}
else if(result[2]==true && result[3]==true && result[0]==false){
  move_two(2,3);
  
}
else if(result[3]==true && result[0]==true && result[1]==false){
  move_two(3,4);
  
}

  configure_topCorners();
}
void move_two(int c1,int c2){
   right_move(c1);
  right_move(c1);
  right_move(c1);
  left_move(c2);
  left_move(c2);
  left_move(c2);
  
}

void top_cornerfix(){
   
  //
 for(int i=0;i<4;i++){
  
     while(top_Layer[2][2][2]!=5){
       move_rightInverse(1);
     
   }
   rotate(-1,5);
   //println("tik tokkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
 }
 while(top_Layer[2][2][0]!=1){
      rotate(-1,5);
     
   }

}
void move_rightInverse(int side4){
   if(side4==1){
     side4=4;
   }
   rotate(1,side4);
   rotate(-1,6);
   rotate(-1,side4);
   rotate(1,6);
}
int y2;
void final_top(){
   
  if(top_Layer[1][0][0]!=3 && top_Layer[2][1][1]!=4 && top_Layer[1][2][0]!=1 && top_Layer[0][1][1]!=2){
    long_move(1);
    
  }
 
  if(top_Layer[1][0][0]==3 ){
    y2=3;
  }
  else if(top_Layer[2][1][1]==4 ){
    y2=4;
  }
   else if(top_Layer[1][2][0]==1 ){
    y2=1;
  }
   else if(top_Layer[0][1][1]==2 ){
    y2=2;
  }
  
  
  while(top_Layer[1][0][0]!=3 || top_Layer[2][1][1]!=4 || top_Layer[1][2][0]!=1|| top_Layer[0][1][1]!=2){
    
    long_move(y2);
  }
  println("aawaaaa");
  
 
}

void long_move(int side5){
  right_move(side5);
  left_move(side5);
  for(int i=0;i<5;i++){
     right_move(side5);
  }
  for(int i=0;i<5;i++){
     left_move(side5);
  }
  
}
