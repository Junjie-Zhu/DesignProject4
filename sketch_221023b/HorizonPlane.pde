class HorizonPlane {
    PVector[] vertexes;
    float rotation;
    float lWidth;
    int lType;
    float lHeight;

    HorizonPlane(float r, float w, float h, int t) {
        rotation = r;
        lWidth = w;
        lHeight = h;
        lType = t;
    }

    void initiateVertex() {
        if (lType == 6) {
            vertexes = new PVector[6];
            int j=0;
            while (j < lType) {
                vertexes[j] = new PVector(lWidth * cos(PI / 6 + j * PI / 3 + rotation), lWidth * sin(PI / 6 + j * PI / 3 + rotation), lHeight);
                j += 1;
            }
        }
        else if (lType == 3) {
            vertexes = new PVector[3];
            int j=0;
            while (j < lType) {
                vertexes[j] = new PVector(lWidth * cos(PI / 6 + 2 * j * PI / 3 + rotation), lWidth * sin(PI / 6 + 2 * j * PI / 3 + rotation), lHeight);
                j += 1;
            }
        }
        else if (lType == 12) {
            vertexes = new PVector[12];
            int j=0;
            while (j < (lType / 2)) {
                vertexes[2 * j] = new PVector(lWidth * cos(PI / 6 + j * PI / 3 + rotation), lWidth * sin(PI / 6 + j * PI / 3 + rotation), lHeight);
                vertexes[2 * j + 1] = new PVector(0.8 * lWidth * cos(PI / 4 + j * PI / 3 + rotation), 0.8 * lWidth * sin(PI / 4 + j * PI / 3 + rotation), lHeight);
                j += 1;
            }
        }
        else if (lType == 8) {
            vertexes = new PVector[8];
            int j=0;
            while (j < lType - 1) {
                vertexes[j] = new PVector(lWidth * cos(2 * j * PI / 7 + rotation), lWidth * sin(2 * j * PI / 7 + rotation), lHeight);
                j += 1;
            }
            vertexes[7] = new PVector(0.7 * lWidth * cos(-PI / 12 + rotation), 0.7 * lWidth * sin(-PI / 12 + rotation), lHeight);
        }
    }

    void linkVertex(int[] c) {
        fill(c[0], c[1], c[2]);
        
        int i=0;
        beginShape();
        while (i < lType) {
            vertex(vertexes[i].x, vertexes[i].y, vertexes[i].z);
            i += 1;
        }
        endShape();
    }
}