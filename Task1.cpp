#include <cmath>
#include <iostream>
#include <string>

// I broke this down into parts to be more sure I was doing it right
double EvaluatePoints(double _x, double _y, int &_counter){
    double a = -(_y + 47);
    double b = fabs((_x/2) + _y + 47);
    double c = fabs(_x - (_y + 47));

    double sqB = sqrt(b);
    double sqC = sqrt(c);

    _counter++;
    return (a * sin(sqB)) - (_x * sin(sqC));
}

void RHC(double _sp[2], int _p, double _z, int _seed, double (&_out)[2], int &_counter, double &_outVal){
    // Set seed
    srand(_seed);

    // Guarantee that any solution will be smaller than _out in first run
    _out[0] = _sp[0];
    _out[1] = _sp[1];
    
    // Store value of best solution
    _outVal = EvaluatePoints(_out[0], _out[1], _counter);

    // Did one of the samples have a lower value?
    bool improved = true;

    // Repeat until no samples are better than current best solution
    while(improved){
        // Set false, only set true if one of the samples is better
        improved = false;

        // Generate samples
        for(int i = 0; i < _p; i++){
            double x = _out[0] + _z * (2 * (double)rand()/RAND_MAX - 1);
            double y = _out[1] + _z * (2 * (double)rand()/RAND_MAX - 1);
            
            // Enforce bounds
            if(x < -512) {x = -512;}
            if(x > 512) {x = 512;}
            if(y < -512) {y = -512;}
            if(y > 512) {y = 512;}
            
            // Evaluate solution
            double curVal = EvaluatePoints(x, y, _counter);

            // Test samples for improvement
            if(curVal < _outVal){
                improved = true;
                _out[0] = x;
                _out[1] = y;
                _outVal = curVal;
            }
        }
    }
}

int main(int argc, char** argv){
    // Read command line arguments
    double sp[2] = {std::atof(argv[1]), std::atof(argv[2])};
    int p = std::atoi(argv[3]);
    double z = std::atof(argv[4]);
    int seed = std::atoi(argv[5]);

    // Set up output variables
    double out[2];
    double outVal;
    int counter = 0;

    // Do the thing
    RHC(sp, p, z, seed, out, counter, outVal);

    // Print output
    std::cout << std::to_string(sp[0]) 
    << ", " + std::to_string(sp[1]) 
    << ", " + std::to_string(p)
    << ", " + std::to_string(z)
    << ", " + std::to_string(seed)
    << ", " + std::to_string(counter)
    << ", " + std::to_string(out[0])
    << ", " + std::to_string(out[1])
    << ", " + std::to_string(outVal)        
    << "\n";
}