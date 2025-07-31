namespace targets {
class Alien {
    public:

        int x_coordinate{};
        int y_coordinate{};

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
            if (health == 0) {
                return false;
            } else {return true;}
        }
        bool teleport(int x_new, int y_new){
            x_coordinate = x_new;
            y_coordinate = y_new;
            return true;
        }
        bool collision_detection(const Alien& pos) {
            if ((x_coordinate == pos.x_coordinate) && (y_coordinate == pos.y_coordinate)) {
                return true;
            } else {return false;}
        }
    private:
        int health{3};
    };
}
  // namespace targets


