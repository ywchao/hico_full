import sys
import os
caffe_root = './external/caffe'
sys.path.insert(0, os.path.join(caffe_root, 'python'))

import numpy as np
import caffe
import lmdb
import os
import scipy.io as sio

os.environ['LMDB_FORCE_CFFI'] = '1'
caffe.set_device(0)
caffe.set_mode_gpu()

def sigmoid(x):
    return 1 / (1 + np.exp(-x))

print 'prepare net'
net = caffe.Net('./models/hico_test.prototxt',
                './models/hico_iter_40000.caffemodel',
                caffe.TEST)

print 'start'
num = 9658
all_score = np.zeros((num, 600), dtype=np.float32)
ori_label = np.zeros((num, 600))
i = 0
for i in xrange(0,num):
    out = net.forward();
    res = net.blobs['fc8'].data
    score = sigmoid(res[0])
    all_score[i,:] = score
    print np.where(score > 0.5)
    print i

sio.savemat('data/test-result.mat', {'all_score':all_score})
