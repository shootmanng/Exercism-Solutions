namespace targets {
class Alien {
    public:

        Alien(int x, int y) {
            // dont initialize with int again here
            // or it will throw a warning
            x_coordinate = x;
            y_coordinate = y;
        }
        int get_health() {
            return health;
        }
        bool hit() {
            if(health > 0) {
                health -= 1;
            }
            return true;
        }
        bool is_alive() {
           return health > 0;
        }
        bool teleport(int x_new, int y_new){
            x_coordinate = x_new;
            y_coordinate = y_new;
            return true;
        }
        bool collision_detection(const Alien& pos) {
            return (x_coordinate == pos.x_coordinate) && (y_coordinate == pos.y_coordinate);
        }

        int x_coordinate{};
        int y_coordinate{};

    private:
        int health{3};
        
    };
}
  // namespace targets


