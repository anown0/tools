#!/usr/bin/python

from pylab import *
import scipy.signal as signal


#Plot frequency and phase response
def mfreqz(b,a=1):
    w,h = signal.freqz(b,a)
    h_dB = 20 * log10 (abs(h))
    subplot(211)
    plot(w/max(w),h_dB)
    ylim(-150, 5)
    ylabel('Magnitude (db)')
    xlabel(r'Normalized Frequency (x$\pi$rad/sample)')
    title(r'Frequency response')
    subplot(212)
    h_Phase = unwrap(arctan2(imag(h),real(h)))
    plot(w/max(w),h_Phase)
    ylabel('Phase (radians)')
    xlabel(r'Normalized Frequency (x$\pi$rad/sample)')
    title(r'Phase response')
    subplots_adjust(hspace=0.5)
    show()    

#Plot step and impulse response
def impz(b,a=1):
    l = len(b)
    impulse = repeat(0.,l); impulse[0] =1.
    x = arange(0,l)
    response = signal.lfilter(b,a,impulse)
    subplot(211)
    stem(x, response)
    ylabel('Amplitude')
    xlabel(r'n (samples)')
    title(r'Impulse response')
    subplot(212)
    step = cumsum(response)
    stem(x, step)
    ylabel('Amplitude')
    show()

# Low Pass FIR filter
# Windows -- hanning, hamming, boxcar, bartlett (gaussian and other windows need additional parameters) see get_window()
def lpfir(taps=50,cutoff=0.3,window='hamming'):
    lp = signal.firwin(taps,cutoff,window)   
    return lp
     
# High Pass FIR filter
def hpfir(taps=50,cutoff=0.3,window='hamming'):
    hp = signal.firwin(taps,cutoff,window)   
    #Use spectral inversion to convert low pass to high pass
    hp = -hp
    hp[taps/2] = hp[taps/2] + 1
    return hp 

# Band Pass FIR filter
def bpfir(taps=50,cutoff_low=0.3,cutoff_high=0.5,window="blackmanharris"):
    lp=lpfir(taps,cutoff_low,window)
    hp=hpfir(taps,cutoff_high,window)
    bp=-(lp+hp)
    bp[taps/2]=bp[taps/2]+1
    return hp 





