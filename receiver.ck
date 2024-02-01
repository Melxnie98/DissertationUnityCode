OscIn oin;
OscMsg msg;
string s;

// Define port to use & create an address in the receiver, expect string
6449 => oin.port;
oin.addAddress( "/unity/send" );

// Set up Sin, pulse & Square waves
SinOsc oscillator => Gain gain => dac;
SinOsc busOsc => Gain busGain => dac;

TriOsc triangle => Gain triGain => dac;
0 => int j;
//adding a second int value for peace of mind that things dont overlap 
0 => int i;

// Set the amplitude of the signal
0.0 => oscillator.freq;
0.00 => gain.gain;
0.0 => triangle.freq;
0.00 => triGain.gain;
0.0 => busOsc.freq;
0.00 => busGain.gain;

// Loop forever
while( true )
{
    oin => now;
    
    while( oin.recv(msg) )
    {
       
        // print stuff
        cherr <= "received OSC message: \"" <= msg.address <= "\" "
        <= "typetag: \"" <= msg.typetag <= "\" "
        <= "arguments: " <= msg.numArgs() <= IO.newline();
        
        // check typetag + the first data element as string
        if( msg.typetag == "s" )
        {      
            
            msg.getString(0) => s;
            <<<s>>>;
             0=>i;
             0=>j;
            
            if(s == "pressure")
            {
                until( i == 1 )
                {
                    10 => triangle.freq;
                    10.00 => triGain.gain;
                    1+=>i;
                    1::second => now; 
                }
                0 => triangle.freq;
                0.00 => triGain.gain;
            }
            if(s == "gshake")
            {
                until( i == 1 )
                {
                    3 => triangle.freq; 
                    7.0 => triGain.gain; 
                    1+=>i;
                    0.5::second => now; 
                }
                0 => triangle.freq;
                0.00 => triGain.gain; 
            }
            if(s == "gjerk")
            {
                until( i == 1 )
                {
                    5 => triangle.freq; 
                    6.0 => triGain.gain;
                    1+=>i;
                    0.2::second => now;
                    
                    }
                    0=> triangle.freq; 
                    0.0 => triGain.gain;
            }
            if(s == "liftup")
            {
                until( i == 1 )
                {
                    12 => oscillator.freq;
                    8.00 => gain.gain;
                    1+=>i;
                    13::second => now;
                }
                0 => oscillator.freq;
                0.00 => gain.gain;
      
            }
            if(s == "sqjerk")
            { 
                until( i == 1 )
                {
                    15.0 => oscillator.freq;
                    9.00 => gain.gain;
                    1+=>i;
                    0.5::second => now; 
                }
                0.0 => oscillator.freq;
                0.00 => gain.gain;
            }
            if(s == "busvib")
            { 
                until( j == 1 )
                {
                    11.0 => busOsc.freq;
                    7.00 => busGain.gain;
                    1+=>j;
                    17::second => now;    
                }
                11.0 => busOsc.freq;
                7.00 => busGain.gain;                
            }
            if(s == "bumpy")
            {
                until( i == 1 )
                {
                    10 => triangle.freq; 
                    8.0 => triGain.gain;
                    1+=>i;
                    0.5::second => now;
                }
                0=> triangle.freq; 
                0.0 => triGain.gain;
             }
            if(s == "slowstop")
            { 
                until( j == 1 )
                {
                    7.0 => busOsc.freq;
                    7.00 => busGain.gain;
                    0.5::second => now;
                    4.0 => busOsc.freq;
                    5.00 => gain.gain;
                    0.5::second => now;
                    1.0 => busOsc.freq;
                    2.00 => busGain.gain;
                    1+=>j;
                    0.5::second => now;
                    
                }
                6.0 => busOsc.freq;
                4.00 => busGain.gain;
            }
            if(s == "accelerate")
            { 
                until( i == 1 )
                {
                    2.0 => busOsc.freq;
                    4.00 => busGain.gain;
                    1::second => now;
                    4.0 => busOsc.freq;
                    5.00 => busGain.gain;
                    3::second => now;
                    8.0 => busOsc.freq;
                    7.00 => busGain.gain;
                    2::second => now;
                    1+=>i;
                }
                11.0 => busOsc.freq;
                7.00 => busGain.gain; 
            }
            if(s == "extrabumpy")
            {
                until( i == 1 )
                {
                    12.0 => triangle.freq;
                    9.00 => triGain.gain;
                    1+=>i;
                    4::second => now;
                    
                }
                0.0 => triangle.freq;
                0.00 => triGain.gain;
            }
        
            if(s == "slowvib")
            {
                until( j == 1 )
                {
                    5.0 => busOsc.freq;
                    10.00 => busGain.gain;
                    1+=>j;
                    2::second => now;
                }
                11.0 => busOsc.freq;
                7.00 => busGain.gain;
            }
            if(s == "strongbusvib")
            {
                until( i == 1 )
                {
                    18.0 => oscillator.freq;
                    10.00 => gain.gain;
                    1+=>i;
                    2.7::second => now;
                    }
                11.0 => oscillator.freq;
                7.00 => gain.gain;
            }
            if(s == "stop")
            { 
                0.0 => oscillator.freq;
                0.00 => gain.gain;
                0.0 => triangle.freq;
                0.00 => triGain.gain;
                0.0 => busOsc.freq;
                0.00 => busGain.gain;
                10::minute => now;
            }    
        }
    }
}